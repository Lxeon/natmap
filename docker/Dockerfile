ARG VERSION
ARG TARGETARCH

FROM ubuntu:latest

RUN apt update \
    && apt upgrade -y \
    && apt install -y curl

WORKDIR /opt
# test
RUN echo "VERSION=$VERSION, TARGETARCH=$TARGETARCH"
RUN curl -L -o /opt/natmap "https://github.com/heiher/natmap/releases/download/${VERSION}/natmap-linux-${TARGETARCH}" \
    && chmod +x /opt/natmap
RUN chmod +x /opt/natmap

ENTRYPOINT ["/opt/natmap"]
