FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -yyq upgrade

# Listed requirements and wget
RUN apt-get install -yyq m4 automake autoconf make gcc libtool wget libc6-dev

# Download and run the installer
RUN cd /Pocketmine && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development

# Make the data dir
RUN mkdir /data
VOLUME ['/data']

WORKDIR /PocketMine
ENTRYPOINT ["/PocketMine/start.sh", "--data-path=/data"]
