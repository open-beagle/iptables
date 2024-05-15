#!/bin/bash

apt update
apt install -y pkg-config build-essential autoconf automake libtool pkg-config m4 curl bzip2

BUILD_ROOT="$(pwd)"
BUILD_ARCH="${BUILD_ARCH:-amd64}"

rm -rf "${BUILD_ROOT}/.dist/${BUILD_ARCH}"
mkdir -p "${BUILD_ROOT}/.tmp"

source ${BUILD_ROOT}/src/libmnl.sh
source ${BUILD_ROOT}/src/libnftnl.sh
source ${BUILD_ROOT}/src/iptables.sh

mkdir -p ${BUILD_ROOT}/.dist/${BUILD_ARCH}/usr/local/lib

ldd ${BUILD_ROOT}/.dist/${BUILD_ARCH}/usr/local/sbin/xtables-nft-multi
