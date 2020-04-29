FROM debian:buster
MAINTAINER Habib Quliyev <graypit@gmail.com>
RUN apt-get update && apt-get install -y gnupg2 wget lsb-release && \
wget -O - https://files.freeswitch.org/repo/deb/debian-release/fsstretch-archive-keyring.asc | apt-key add - && \
echo "deb http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" > /etc/apt/sources.list.d/freeswitch.list && \
echo "deb-src http://files.freeswitch.org/repo/deb/debian-release/ `lsb_release -sc` main" >> /etc/apt/sources.list.d/freeswitch.list && \
apt-get update && apt install -y freeswitch-meta-all freeswitch-mod-v8 && apt install -y unixodbc odbc-postgresql && \
apt-get install -y netcat ntpdate net-tools
COPY files/odbc.ini /etc/
COPY files/odbcinst.ini /etc/
COPY files/entryPoint.sh /root/
ENTRYPOINT ["/root/entryPoint.sh"]
