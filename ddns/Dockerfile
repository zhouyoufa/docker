FROM golang:buster AS builder

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

WORKDIR $GOPATH/src/github.com/jeessy2/ddns-go
RUN git clone https://github.com/jeessy2/ddns-go.git $GOPATH/src/github.com/jeessy2/ddns-go
COPY build.sh .
RUN mkdir bin && ./build.sh && cp ./bin/ddns-go /usr/bin/ddns

FROM alpine

LABEL summary="DDNS for ARM"
LABEL description="DDNS for ARM devices"
LABEL maintainer="Zhou You <hi@zhouyou.info>"

COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /usr/bin/ddns /usr/bin/ddns

EXPOSE 9876

ENTRYPOINT ["/usr/bin/ddns"]
