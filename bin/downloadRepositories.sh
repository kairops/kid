#!/bin/bash

REPOSITORIES=$(cat repositories)

createFolder() {
    mkdir -p kid-project
    cd kid-project
}

downloadRepositories() {
    for repository in $REPOSITORIES; do
        directory=$(echo "$repository" | cut -d '/' -f5)
        if [ -d $directory ]; then
            cd $directory
            git pull
            cd ..
        else 
            git clone $repository
        fi
    done
}

createFolder
downloadRepositories