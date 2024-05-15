#!/bin/bash

name=iptables
version=1.8.10
source=(https://netfilter.org/projects/iptables/files/$name-$version.tar.xz)

if [ ! -e ${BUILD_ROOT}/.tmp/$name-$version.tar.xz ]; then
  curl -x socks5://www.ali.wodcloud.com:1283 -sL $source > ${BUILD_ROOT}/.tmp/$name-$version.tar.xz
fi

rm -rf ${BUILD_ROOT}/.tmp/$name-$version
tar -xf ${BUILD_ROOT}/.tmp/$name-$version.tar.xz -C ${BUILD_ROOT}/.tmp/
cd ${BUILD_ROOT}/.tmp/$name-$version

mkdir -p "${BUILD_ROOT}/.dist/${BUILD_ARCH}/usr/local"

if [ $BUILD_ARCH == "loong64" ] ; then
./configure --build=loongarch-unknown-linux-gnu \
  --prefix="${BUILD_ROOT}/.dist/${BUILD_ARCH}/usr/local" \
  --enable-shared=no \
  --enable-static
else 
./configure \
  --prefix="${BUILD_ROOT}/.dist/${BUILD_ARCH}/usr/local" \
  --enable-shared=no \
  --enable-static
fi

export CFLAGS='-static'
export LDFLAGS='-all-static'

make NO_SHARED_LIBS=1
make install