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

### 感谢

[aliyun-ddns-cli](https://github.com/honwen/aliyun-ddns-cli)