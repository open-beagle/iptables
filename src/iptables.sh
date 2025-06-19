#!/bin/bash

name=iptables
version=1.8.10
source=(https://netfilter.org/projects/iptables/files/$name-$version.tar.xz)

if [ ! -e ${BUILD_ROOT}/.tmp/$name-$version.tar.xz ]; then
  if [ -n "${BUILD_SOCKS5}" ]; then
    curl -x ${BUILD_SOCKS5} -sL $source > ${BUILD_ROOT}/.tmp/$name-$version.tar.xz
  else
    curl -sL $source > ${BUILD_ROOT}/.tmp/$name-$version.tar.xz
  fi
fi

rm -rf ${BUILD_ROOT}/.tmp/$name-$version
tar -xf ${BUILD_ROOT}/.tmp/$name-$version.tar.xz -C ${BUILD_ROOT}/.tmp/
cd ${BUILD_ROOT}/.tmp/$name-$version

./configure \
  --prefix=${BUILD_ROOT}/.dist/${BUILD_ARCH}/ \
  --enable-shared=no \
  --enable-static \

export CFLAGS='-static'
export LDFLAGS='-all-static'

make NO_SHARED_LIBS=1
make install