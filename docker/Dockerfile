ARG VERSION
ARG TARGETARCH

FROM ubuntu:latest

RUN apt update \
    && apt upgrade -y \
    && apt install -y curl

WORKDIR /opt
# test
RUN echo "VERSION=$VERSION, TARGETARCH=$TARGETARCH"
ADD https://github.com/heiher/natmap/releases/download/${VERSION}/natmap-linux-${TARGETARCH} /opt/natmap
RUN chmod +x /opt/natmap

ENTRYPOINT ["/opt/natmap"]
