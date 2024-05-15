#!/bin/bash

name=libmnl
version=1.0.5
source=(https://netfilter.org/projects/libmnl/files/$name-$version.tar.bz2)

if [ ! -e ${BUILD_ROOT}/.tmp/$name-$version.tar.bz2 ]; then
  curl -x socks5://www.ali.wodcloud.com:1283 -sL $source > ${BUILD_ROOT}/.tmp/$name-$version.tar.bz2
fi

rm -rf ${BUILD_ROOT}/.tmp/$name-$version
tar -xf ${BUILD_ROOT}/.tmp/$name-$version.tar.bz2 -C ${BUILD_ROOT}/.tmp/

cd ${BUILD_ROOT}/.tmp/$name-$version

if [ $BUILD_ARCH == "loong64" ] ; then
./configure --build=loongarch-unknown-linux-gnu \
  --enable-shared=no \
  --enable-static
else 
./configure \
  --enable-shared=no \
  --enable-static
fi


make NO_SHARED_LIBS=1
make install
