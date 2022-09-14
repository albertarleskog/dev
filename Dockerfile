FROM debian:bullseye

ENV GO_VERSION=1.19

RUN apt-get update && apt-get upgrade -y

RUN apt-get install build-essential git default-jdk wget -y

COPY entrypoint.sh /

RUN /entrypoint.sh
