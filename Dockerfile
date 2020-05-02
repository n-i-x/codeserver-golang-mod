FROM lsiobase/alpine:3.11 as buildstage

ARG GO_VERSION

RUN \
  apk add --no-cache \
    curl \
    grep && \
  if [ -z ${GO_VERSION+x} ]; then \
    GO_VERSION=$(curl -sX GET https://golang.org/dl/ | grep -o '<span.*>.*linux-amd64.*</span>' | grep -oP '\d+\.\d+\.?\d+?'); \
  fi && \
  mkdir -p /root-layer && \
  curl -o \
    /root-layer/golang.tar.gz -L \
    https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz

COPY root/ /root-layer/

# runtime stage
FROM scratch

LABEL maintainer="n-i-x"

# Add files from buildstage
COPY --from=buildstage /root-layer/ /