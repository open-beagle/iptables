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
  registry.cn-qingdao.aliyuncs.com/wod/golang:1.24-bookworm-amd64 \
  bash src/build.sh

# arm64
docker run -it --rm \
  -v $PWD/:/go/src/github.com/open-beagle/iptables \
  -w /go/src/github.com/open-beagle/iptables \
  registry.cn-qingdao.aliyuncs.com/wod/golang:1.24-bookworm-arm64 \
  bash src/build.sh
```
