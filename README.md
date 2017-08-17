# docker-jenkins-android

Docker image for Jenkins pipeline android build. It includes the following:

* Source Image:
  * ```frolvlad/alpine-oraclejdk8:slim``` (https://hub.docker.com/r/frolvlad/alpine-oraclejdk8/)
    * Supports fixes for Android build tools aapt error as follows:

      ```
      java.io.IOException: Cannot run program "/usr/local/android-sdk-linux/build-tools/25.0.3/aapt": error=2, No such file or directory
        at java.lang.ProcessBuilder.start(ProcessBuilder.java:1048)
        at com.android.builder.png.AaptProcess$Builder.start(AaptProcess.java:167)
        at com.android.builder.png.QueuedCruncher$1.creation(QueuedCruncher.java:118)
        at com.android.builder.tasks.WorkQueue.run(WorkQueue.java:203)
        at java.lang.Thread.run(Thread.java:748)
      Caused by: java.io.IOException: error=2, No such file or directory
        at java.lang.UNIXProcess.forkAndExec(Native Method)
        at java.lang.UNIXProcess.<init>(UNIXProcess.java:247)
        at java.lang.ProcessImpl.start(ProcessImpl.java:134)
        at java.lang.ProcessBuilder.start(ProcessBuilder.java:1029)
      ```

* Android SDK Packages:
  * Refer to the ```packagesFile.txt``` file
  * Uses the new ```sdkmanager``` command instead of the old ```android update sdk``` command
* Gradle Version: 3.5

Docker Hub: [docker-jenkins-android](https://hub.docker.com/r/chiahan1123/docker-jenkins-android/)
