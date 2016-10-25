FROM resin/raspberrypi-node

MAINTAINER Nat Weerawan<nat@cmmc.io> 
RUN apt-get update

##################################################
# Install tools                                  #
##################################################

RUN apt-get install -y curl wget git apt-transport-https python build-essential make g++ libavahi-compat-libdnssd-dev libkrb5-dev vim net-tools


RUN alias ll='ls -alG'

RUN apt-get install -y avahi-daemon avahi-utils

RUN npm install -g homebridge
RUN npm install -g homebridge-openhab


USER root

RUN mkdir -p /var/run/dbus

EXPOSE 5353 51826

ADD run.sh /root/run.sh 

RUN mkdir /root/.homebridge
ADD config.json /root/.homebridge/config.json

CMD ["/root/run.sh"]
