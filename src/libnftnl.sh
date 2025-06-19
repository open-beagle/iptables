#!/bin/bash

name=libnftnl
version=1.2.6
source=(https://netfilter.org/projects/libnftnl/files/$name-$version.tar.xz)

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
  --enable-shared=no \
  --enable-static

make NO_SHARED_LIBS=1
make install
