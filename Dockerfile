FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

# Listed requirements and wget
RUN apt-get install -y m4 automake autoconf make gcc libtool wget

# Download and run the installer
ADD http://cdn.pocketmine.net/installer.sh /PocketMine/
RUN chmod a+x /PocketMine/installer.sh
RUN cd PocketMine && ./installer.sh

# Make the data dir
RUN mkdir /data
VOLUME ['/data']

WORKDIR /PocketMine
ENTRYPOINT ["/PocketMine/start.sh", "--data-path=/data"]
