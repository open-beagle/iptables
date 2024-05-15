# iptables

为 ansible-docker 项目准备可跨平台的 iptables 二进制文件。

## deps

- libmnl , 需要自行编译
- libnftnl , 需要自行编译

```bash
# amd64
docker run -it --rm \
-v $PWD/:/go/src/github.com/open-beagle/iptables \
-w /go/src/github.com/open-beagle/iptables \
-e BUILD_ARCH=amd64 \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.22-amd64 \
bash src/build.sh

# arm64
docker run -it --rm \
-v $PWD/:/go/src/github.com/open-beagle/iptables \
-w /go/src/github.com/open-beagle/iptables \
-e BUILD_ARCH=arm64 \
registry.cn-qingdao.aliyuncs.com/wod/golang:1.22-arm64 \
bash src/build.sh
```

## loong64

```bash
# loong64
docker run -it --rm \
-v $PWD/:/go/src/github.com/open-beagle/iptables \
-w /go/src/github.com/open-beagle/iptables \
-e BUILD_ARCH=loong64 \
cr.loongnix.cn/library/debian:buster \
bash src/build.sh

docker build \
  --build-arg BASE=registry.cn-qingdao.aliyuncs.com/wod/alpine:3-amd64 \
  --build-arg AUTHOR=mengkzhaoyun@gmail.com \
  --build-arg VERSION=v1.8.0 \
  --build-arg TARGETOS=linux \
  --build-arg TARGETARCH=loong64 \
  --tag registry.cn-qingdao.aliyuncs.com/wod/iptables:v1.8.0-loong64 \
  --file ./.beagle/dockerfile .

docker push registry.cn-qingdao.aliyuncs.com/wod/iptables:v1.8.0-loong64
```
