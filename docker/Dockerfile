ARG VERSION="master"
ARG TARGETARCH

FROM ubuntu:latest

ARG VERSION
ARG TARGETARCH

RUN apt update \
    && apt upgrade -y \
    && apt install -y curl

WORKDIR /opt
# test
ENV VERSION=${VERSION} TARGETARCH=${TARGETARCH}
RUN echo "Building for VERSION=${VERSION}, TARGETARCH=${TARGETARCH}"

RUN curl -L -o /opt/natmap "https://github.com/heiher/natmap/releases/download/${VERSION}/natmap-linux-${TARGETARCH}" \
    && chmod +x /opt/natmap

ENTRYPOINT ["/opt/natmap"]
