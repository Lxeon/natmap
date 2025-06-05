FROM ubuntu:latest

ARG ARCH
ARG VERSION

RUN apt update \
    && apt upgrade -y \
    && apt install -y curl

WORKDIR /opt

ADD https://github.com/heiher/natmap/releases/download/${VERSION}/natmap-linux-${ARCH} /opt/natmap

ENTRYPOINT ["/opt/natmap"]
