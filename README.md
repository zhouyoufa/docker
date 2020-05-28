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


### UnblockNeteaseMusic by NodeJS

##### 使用方式

```shell
docker run -d --name music-node zhouu/unblockmusic-node -s -e https://music.163.com -p 8080:8081
```

##### 镜像构建
```shell
docker buildx build --platform linux/amd64,linux/arm,linux/arm64 --rm -t zhouu/unblockmusic-node -f Dockerfile .
```


### Certbot

##### 使用方式

```shell
CERTBOT_VERSION=1.4.0; docker run -d --name certbot -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" zhouu/certbot:${CERTBOT_VERSION} certonly --agree-tos --non-interactive -d example.com
```

##### 镜像构建

```shell
CERTBOT_VERSION=1.4.0; docker buildx build --platform linux/amd64,linux/arm,linux/arm64 --build-arg CERTBOT_VERSION=${CERTBOT_VERSION} --push --rm -t zhouu/certbot:${CERTBOT_VERSION} -f Dockerfile .
```


### Certbot using aliyun dns plugin

##### 使用方式

1. Credentials File

   ```shell
   certbot_dns_aliyun:dns_aliyun_access_key = 12345678
   certbot_dns_aliyun:dns_aliyun_access_key_secret = 1234567890abcdef1234567890abcdef

   chmod 600 /path/to/credentials.ini
   ```

2. 运行程序

   ```shell
   CERTBOT_VERSION=1.4.0; docker run -d --name certbot -v "/etc/letsencrypt:/etc/letsencrypt" -v "/var/lib/letsencrypt:/var/lib/letsencrypt" -v "/var/log/letsencrypt:/var/log/letsencrypt" zhouu/certbot-dns-aliyun:${CERTBOT_VERSION} certonly --agree-tos --non-interactive -a certbot-dns-aliyun:dns-aliyun --certbot-dns-aliyun:dns-aliyun-credentials /etc/letsencrypt/secrets/aliyun.ini -d example.com
   ```

##### 镜像构建

```shell
CERTBOT_VERSION=1.4.0; docker buildx build --platform linux/amd64,linux/arm,linux/arm64 --build-arg CERTBOT_VERSION=${CERTBOT_VERSION} --push --rm -t zhouu/certbot-dns-aliyun:${CERTBOT_VERSION} -f Dockerfile .
```


### 感谢

[aliyun-ddns-cli](https://github.com/honwen/aliyun-ddns-cli)

[ads](https://github.com/c-mueller/ads)

[bogus](https://github.com/missdeer/bogus)

[ipset](https://github.com/missdeer/ipset)

[redisc](https://github.com/miekg/redis)

[dnsredir](https://github.com/leiless/dnsredir)

[UnblockNeteaseMusic](https://github.com/cnsilvan/UnblockNeteaseMusic)

[UnblockNeteaseMusic-NodeJS](https://github.com/nondanee/UnblockNeteaseMusic)
