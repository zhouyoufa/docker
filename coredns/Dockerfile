FROM golang:buster AS builder

LABEL summary="CoreDNS for ARM"
LABEL description="CoreDNS for ARM devices"
LABEL maintainer="Zhou You <hi@zhouyou.info>"

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

RUN git clone https://github.com/coredns/coredns.git $GOPATH/src/app
WORKDIR $GOPATH/src/app
COPY plugin.cfg .

RUN make && cp ./coredns /usr/bin/coredns

FROM scratch

COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /usr/bin/coredns /usr/bin/coredns

EXPOSE 53 53/udp

ENTRYPOINT ["/usr/bin/coredns"]
