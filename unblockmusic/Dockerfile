FROM golang:buster AS builder

LABEL summary="UnblockNeteaseMusic for ARM"
LABEL description="UnblockNeteaseMusic for ARM devices"
LABEL maintainer="Zhou You <hi@zhouyou.info>"

RUN apt-get update && apt-get -uy upgrade
RUN apt-get -y install ca-certificates && update-ca-certificates

RUN go get -d -v github.com/cnsilvan/UnblockNeteaseMusic
WORKDIR $GOPATH/src/github.com/cnsilvan/UnblockNeteaseMusic
COPY build.sh .
RUN mkdir bin && ./build.sh && cp ./bin/UnblockNeteaseMusic /usr/bin/unblockmusic

FROM scratch

COPY --from=builder /etc/ssl/certs /etc/ssl/certs
COPY --from=builder /usr/bin/unblockmusic /usr/bin/unblockmusic

EXPOSE 80 443

ENTRYPOINT ["/usr/bin/unblockmusic"]
