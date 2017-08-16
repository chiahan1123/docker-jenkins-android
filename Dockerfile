FROM openjdk:8-slim
LABEL maintainer="Eric Chang <chiahan1123@gmail.com>"

# - git is required to checkout GitHub projects
# - lib32stdc++6 lib32z1 is required to fix the following:
#     java.io.IOException: Cannot run program "/usr/local/android-sdk-linux/build-tools/25.0.3/aapt": error=2, No such file or directory
#       at java.lang.ProcessBuilder.start(ProcessBuilder.java:1048)
#       at com.android.builder.png.AaptProcess$Builder.start(AaptProcess.java:167)
#       at com.android.builder.png.QueuedCruncher$1.creation(QueuedCruncher.java:118)
#       at com.android.builder.tasks.WorkQueue.run(WorkQueue.java:203)
#       at java.lang.Thread.run(Thread.java:748)
#     Caused by: java.io.IOException: error=2, No such file or directory
#       at java.lang.UNIXProcess.forkAndExec(Native Method)
#       at java.lang.UNIXProcess.<init>(UNIXProcess.java:247)
#       at java.lang.ProcessImpl.start(ProcessImpl.java:134)
#       at java.lang.ProcessBuilder.start(ProcessBuilder.java:1029)
RUN apt-get update && \
    apt-get install -y --no-install-recommends wget git lib32stdc++6 lib32z1 && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/android-sdk-linux
ENV ANDROID_SDK_TOOLS_FILE sdk-tools-linux-3859397.zip
RUN wget https://dl.google.com/android/repository/$ANDROID_SDK_TOOLS_FILE && \
    unzip $ANDROID_SDK_TOOLS_FILE && \
    rm $ANDROID_SDK_TOOLS_FILE

ENV ANDROID_HOME /usr/local/android-sdk-linux
ENV PATH $PATH:$ANDROID_HOME/tools/bin
ENV PATH $PATH:$ANDROID_HOME/platform-tools

COPY packagesFile.txt /packagesFile.txt
RUN echo y | sdkmanager --verbose --package_file=/packagesFile.txt && \
    rm /packagesFile.txt
