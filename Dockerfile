FROM ubuntu:10.04
maintainer Hitoshi.Ooyama<hitoshi.ooyama@gmo-gc.com>

ADD script/jdk-6u45-linux-x64.bin /tmp/jdk-6u45-linux-x64.bin
ADD script/init.sh /usr/local/src/init.sh
ADD script/gingerbread.patch /usr/local/src/gingerbread.patch
RUN echo "Asia/Tokyo" > /etc/timezone \
 && dpkg-reconfigure -f noninteractive tzdata \
 && apt-get update \
 && apt-get install -y python-software-properties \
 && add-apt-repository ppa:git-core/ppa \
 && apt-get update \
 && apt-get -y upgrade \
 && apt-get install -y git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev libc6-dev lib32ncurses5-dev ia32-libs x11proto-core-dev libx11-dev lib32readline5-dev lib32z-dev libgl1-mesa-dev g++-multilib mingw32 tofrodos python-markdown libxml2-utils xsltproc vim subversion doxygen\
 && apt-get clean \
 && rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /bin/repo \
 && chmod a+x /bin/repo \
 && git config --global color.ui auto \
 && mkdir -p /var/cache/apt/archives/partial \
 && mkdir -p /var/lib/apt/lists/partial \
 && locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:jp  
ENV LC_ALL ja_JP.UTF-8
WORKDIR /usr/java/
RUN chmod +x /tmp/jdk-6u45-linux-x64.bin \
 && sleep 10 \
 && sh -c "/tmp/jdk-6u45-linux-x64.bin" \
 && rm -f /tmp/jdk-6u45-linux-x64.bin \
 && update-alternatives --install /usr/bin/java  java  /usr/java/jdk1.6.0_45/bin/java  100 \
 && update-alternatives --install /usr/bin/java  java  /usr/java/jdk1.6.0_45/bin/java  100 \
 && update-alternatives --install /usr/bin/javac javac /usr/java/jdk1.6.0_45/bin/javac 100 \
 && update-alternatives --install /usr/bin/jar   jar   /usr/java/jdk1.6.0_45/bin/jar   100 \
 && update-alternatives --install /usr/bin/javah javah /usr/java/jdk1.6.0_45/bin/javah 100 \
 && update-alternatives --install /usr/bin/javadoc javadoc /usr/java/jdk1.6.0_45/bin/javadoc 100 \
 && update-alternatives --install /usr/bin/jarsigner jarsigner /usr/java/jdk1.6.0_45/bin/jarsigner 100
WORKDIR /usr/local/src/

