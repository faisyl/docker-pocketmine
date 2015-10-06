FROM bartt/ubuntu-base

RUN apt-get -y install python3-yaml

# Download and run the installer
RUN mkdir /Pocketmine && cd /Pocketmine && curl -sL http://get.pocketmine.net/ | bash -s - -r -v development

# Make the data dir
RUN mkdir /data
VOLUME ['/data']

WORKDIR /PocketMine
ENTRYPOINT ["/PocketMine/start.sh", "--data-path=/data"]
