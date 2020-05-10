FROM golang:buster AS builder

LABEL summary="Aliyun DDNS for ARM"
LABEL description="Aliyun DDNS for ARM devices"
LABEL maintainer="Zhou You <hi@zhouyou.info>"

ENV CGO_ENABLED=0

RUN apt-get update \ 
    && apt-get -uy upgrade \
    && apt-get -y install ca-certificates curl  \
    && update-ca-certificates \
    && set -ex \ 
    && go get -u -v \
        -ldflags "-X main.version=$(curl -sSL https://api.github.com/repos/chenhw2/aliyun-ddns-cli/commits/master | \
            sed -n '{/sha/p; /date/p;}' | sed 's/.* \"//g' | cut -c1-10 | tr '[:lower:]' '[:upper:]' | sed 'N;s/\n/@/g' | head -1)" \
        github.com/chenhw2/aliyun-ddns-cli

FROM alpine

ENV ACCESS_ID      ""
ENV ACCESS_SECRET  "" 
ENV IP_API         "http://myip.ipip.net"

COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /go/bin/aliyun-ddns-cli /usr/bin/ddns

ENTRYPOINT [ "sh", "-c", "/usr/bin/ddns --id ${ACCESS_ID} --secret ${ACCESS_SECRET} --api ${IP_API} $0 $@"]
