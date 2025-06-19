#!/bin/bash

apt update
apt install -y pkg-config build-essential autoconf automake libtool pkg-config m4 curl bzip2

BUILD_ROOT="$(pwd)"
BUILD_SOCKS5="${BUILD_SOCKS5:-}"

# 自动检测系统架构
detect_arch() {
    local arch=$(uname -m)
    case $arch in
        x86_64)
            echo "amd64"
            ;;
        aarch64|arm64)
            echo "arm64"
            ;;
        armv7l|armv8l)
            echo "arm"
            ;;
        *)
            echo "amd64"  # 默认使用 amd64
            ;;
    esac
}

# 如果没有设置 BUILD_ARCH，则自动检测
if [ -z "${BUILD_ARCH}" ]; then
    BUILD_ARCH=$(detect_arch)
fi

rm -rf "${BUILD_ROOT}/.dist/${BUILD_ARCH}"
mkdir -p "${BUILD_ROOT}/.tmp"

source ${BUILD_ROOT}/src/libmnl.sh
source ${BUILD_ROOT}/src/libnftnl.sh
source ${BUILD_ROOT}/src/iptables.sh

xx-verify ${BUILD_ROOT}/.dist/${BUILD_ARCH}/sbin/xtables-nft-multi
