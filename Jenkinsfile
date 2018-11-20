#!groovy

@Library('github.com/red-panda-ci/jenkins-pipeline-library') _

// Initialize global config
cfg = jplConfig('kairops-kid','backend','', [slack: '#integrations', email:'integrations+kairops-kid@kairosds.com'])

pipeline {
    agent none

    stages {
        stage ('Initialize') {
            agent { label 'master' }
            steps  {
                jplStart(cfg)
            }
        }
        stage ('Test') {
            agent { label 'docker' }
            when { expression { (env.BRANCH_NAME == 'develop') || env.BRANCH_NAME.startsWith('PR-') || env.BRANCH_NAME.startsWith('feature/') } }
            steps  {
                sh 'bin/test.sh'
            }
            post {
                always {
                    archiveArtifacts artifacts: 'test/reports/*', fingerprint: true, allowEmptyArchive: true
                }
            }
        }
        stage('Sonarqube Analysis') {
            when { expression { (env.BRANCH_NAME == 'develop') || env.BRANCH_NAME.startsWith('PR-') } }
            agent { label 'docker' }
            steps {
                jplSonarScanner(cfg)
            }
        }
        stage ('Release confirm') {
            when { expression { env.BRANCH_NAME.startsWith('release/v') || env.BRANCH_NAME.startsWith('hotfix/v') } }
            steps {
                jplPromoteBuild(cfg)
            }
        }
        stage ('Release finish') {
            agent { label 'docker' }
            when { expression { ( env.BRANCH_NAME.startsWith('release/v') || env.BRANCH_NAME.startsWith('hotfix/v')) && cfg.promoteBuild.enabled } }
            steps {
                sh "make; git add README.md; git commit -m 'Docs: Update README.md file' || true"
                sh "git push -u origin ${env.BRANCH_NAME} || true"
                jplCloseRelease(cfg)
            }
        }
    }

    post {
        always {
            jplPostBuild(cfg)
        }
    }

    options {
        timestamps()
        ansiColor('xterm')
        buildDiscarder(logRotator(artifactNumToKeepStr: '20',artifactDaysToKeepStr: '30'))
        disableConcurrentBuilds()
        skipDefaultCheckout()
        timeout(time: 1, unit: 'DAYS')
    }
}
