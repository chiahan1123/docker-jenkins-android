# docker-jenkins-android

Docker image for Jenkins pipeline android build. It includes the following:

* Source Image: ```openjdk:8-slim```
* Android SDK Packages:
  * Refer to the ```packagesFile.txt``` file

* TODO:
  * Use ```openjdk:8-alpine``` instead of ```openjdk:8-slim```
    * Need both libraries in alpine: lib32stdc++6 lib32z1 (https://pkgs.alpinelinux.org/packages)

Docker Hub: [docker-jenkins-android](https://hub.docker.com/r/chiahan1123/docker-jenkins-android/)
