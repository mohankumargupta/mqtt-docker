FROM debian:jessie-backports
MAINTAINER Mohan Gupta <mohangupta@live.com>

RUN apt-get update && apt-get -y -q install mosquitto mosquitto-clients  && \
    mkdir -p /mosquitto/config /mosquitto/data /mosquitto/log && \
    cp /etc/mosquitto/mosquitto.conf /mosquitto/config

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/usr/sbin/mosquitto", "-c", "/mosquitto/config/mosquitto.conf"]
