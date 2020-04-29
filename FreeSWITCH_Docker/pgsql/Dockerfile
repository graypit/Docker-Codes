FROM postgres:alpine
MAINTAINER Habib Quliyev <graypit@gmail.com>
RUN apk add netcat-openbsd curl
ADD ./init /docker-entrypoint-initdb.d/

