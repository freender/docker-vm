FROM ubuntu:latest
MAINTAINER Michael Smyk (https://github.com/freender)
ENV LANG=C.UTF-8 DEBIAN_FRONTEND=noninteractive TZ= UPSNAME= UPCABLE= UPSTYPE= DEVICE= POLLTIME= ONBATTERYDELAY= BATTERYLEVEL= MINUTES= TIMEOUT= SELFTEST= APCUPSD_SLAVES=

COPY scripts /usr/local/bin

RUN echo Starting. \
 && apt-get -q -y update \
 && apt-get -q -y install --no-install-recommends curl apcupsd dbus libapparmor1 libdbus-1-3 libexpat1 tzdata\
 && apt-get -q -y full-upgrade \
 && rm -rif /var/lib/apt/lists/* \
 && mv /usr/local/bin/apcupsd         /etc/default/apcupsd \
 && mv /usr/local/bin/apcupsd.conf    /etc/apcupsd/apcupsd.conf \
 && mv /usr/local/bin/hosts.conf      /etc/apcupsd/hosts.conf \
 && mv /usr/local/bin/doshutdown      /etc/apcupsd/doshutdown \
 && mv /usr/local/bin/apccontrol      /etc/apcupsd/apccontrol \
 && mv /usr/local/bin/apcupsd.notify  /etc/apcupsd/apcupsd.notify \
 && mv /usr/local/bin/changeme        /etc/apcupsd/changeme \
 && mv /usr/local/bin/commfailure     /etc/apcupsd/commfailure \
 && mv /usr/local/bin/commok          /etc/apcupsd/commok \
 && mv /usr/local/bin/offbattery      /etc/apcupsd/offbattery \
 && mv /usr/local/bin/onbattery       /etc/apcupsd/onbattery \
 && mkdir -p /etc/apcupsd/telegram \
 && mv /usr/local/bin/telegram/telegram.sh /etc/apcupsd/telegram/telegram.sh \
 && chmod +x /etc/apcupsd/telegram/telegram.sh \
 && echo Finished.

CMD ["/sbin/apcupsd", "-b"]
