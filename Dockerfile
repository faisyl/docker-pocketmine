FROM ubuntu

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get -y upgrade

# Listed requirements and wget
RUN apt-get install -y m4 automake autoconf make gcc libtool wget

# Download and run the installer
RUN cd /Pocketmine && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development

# Make the data dir
RUN mkdir /data
VOLUME ['/data']

WORKDIR /PocketMine
ENTRYPOINT ["/PocketMine/start.sh", "--data-path=/data"]
