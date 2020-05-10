# docker



### Aliyun DDNS

##### 使用方式

```shell
docker pull zhouu/ddns:3410f91

docker run -d -e "ACCESS_ID=xxxxxx" -e "ACCESS_SECRET=xxxxxx" --name ddns --restart=always zhouu/ddns:3410f91 auto-update -d "doamin.example.org" -r 3600
```

##### 镜像构建

```shell
docker buildx build --platform linux/amd64,linux/arm,linux/arm64 --rm -t zhouu/ddns:3410f91 -f Dockerfile . --push
```


### CoreDNS

##### 使用方式

```shell
docker run -d -p 53:53/udp --name coredns --restart=always --cap-add NET_BIND_SERVICE -v /etc/coredns:/etc/coredns zhouu/coredns:1.6.9-886cdd9d -conf /etc/coredns/Corefile
```

##### 镜像构建

```shell
docker buildx build --platform linux/amd64,linux/arm,linux/arm64 --rm -t zhouu/coredns:1.6.9-886cdd9d -f Dockerfile . --push
```


### UnblockNeteaseMusic

##### 使用方式

1. 生成自己的证书

   ```shell
   sudo mkdir /etc/unblockmusic
   sudo ./createCertificate.sh
   ```

2. 运行程序

   ```shell
   docker run -d --name music -p 8080:80 -p 8443:443 -v /etc/unblockmusic/:/etc/unblockmusic/ zhouu/unblockmusic:0.2.0-0c1c2f7 -e -m 0 -c /etc/unblockmusic/certs/server.crt -k /etc/unblockmusic/certs/server.key
   ```

##### 镜像构建
```shell
docker buildx build --platform linux/amd64,linux/arm,linux/arm64 --rm -t zhouu/unblockmusic:0.2.0-0c1c2f7 -f Dockerfile .
```


### 感谢

[aliyun-ddns-cli](https://github.com/honwen/aliyun-ddns-cli)

[ads](https://github.com/c-mueller/ads)

[bogus](https://github.com/missdeer/bogus)

[ipset](https://github.com/missdeer/ipset)

[redisc](https://github.com/miekg/redis)

[dnsredir](https://github.com/leiless/dnsredir)

[UnblockNeteaseMusic](https://github.com/cnsilvan/UnblockNeteaseMusic)
