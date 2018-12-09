# KairOps KID

Kairos ID, Open your Door like we Open our Source Code at Kairos

## Description

Access control project

### Projects services

Kid have several projects, compounds loT (hardware and software) and software services.

Door opening projects:
- [Kid-Lock](https://github.com/kairops/kid-lock):
  - Hardware: Electronic lock, [arduino](https://www.arduino.cc/).
  - Software: Arduino C++

Launch event projects:
- [Kid-NFC](https://github.com/kairops/kid-nfc)
  - Hardware: [NodeMCU](http://www.nodemcu.com/index_en.html), [Mifare RC522 IC Card RFID Module](https://www.amazon.es/s/ref=nb_sb_noss?__mk_es_ES=%C3%85M%C3%85%C5%BD%C3%95%C3%91&url=search-alias%3Ddiy&field-keywords=Mifare+RC522+IC+Card+RFID+Module)
  - Software: Arduino C++  
- [Kid-FaceID](https://github.com/kairops/kid-faceid)
  - Hardware: [Raspberry PI](https://www.raspberrypi.org/), WebCam
  - Software: TBD
- [Kid-FingerPrint](https://github.com/kairops/kid-fingerprint)
  - Hardware: [NodeMCU](http://www.nodemcu.com/index_en.html), [Fingerprint Scanner - TTL (GT-521F32)](https://learn.sparkfun.com/tutorials/fingerprint-scanner-gt-521fxx-hookup-guide/all)
  - Software: Arduino C++

Event server projects:
- [Kid-Event-Server](https://github.com/kairops/kid-event-server)
  - Software: NodeJS

DataBases projects:
- [Kid-DB](https://github.com/kairops/kid-db)
  - Software: NodeJS, Redis, RabbitMQ, Mysql
- [Kid-Log](https://github.com/kairops/kid-log)
  - Software: NodeJS, Redis, RabbitMQ, MongoDB

DashBoard projects:
- [Kid-Dashboard-Front](https://github.com/kairops/kid-dashboard-front)
  - Software: Angular 2
- [Kid-Dashboard-Back](https://github.com/kairops/kid-dashboard-back)
  - Software: NodeJS