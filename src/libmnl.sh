#!/bin/bash

name=libmnl
version=1.0.5
source=(https://netfilter.org/projects/libmnl/files/$name-$version.tar.bz2)

if [ ! -e ${BUILD_ROOT}/.tmp/$name-$version.tar.bz2 ]; then
  if [ -n "${BUILD_SOCKS5}" ]; then
    curl -x ${BUILD_SOCKS5} -sL $source > ${BUILD_ROOT}/.tmp/$name-$version.tar.bz2
  else
    curl -sL $source > ${BUILD_ROOT}/.tmp/$name-$version.tar.bz2
  fi
fi

rm -rf ${BUILD_ROOT}/.tmp/$name-$version
tar -xf ${BUILD_ROOT}/.tmp/$name-$version.tar.bz2 -C ${BUILD_ROOT}/.tmp/

cd ${BUILD_ROOT}/.tmp/$name-$version

./configure \
  --enable-shared=no \
  --enable-static

make NO_SHARED_LIBS=1
make install
