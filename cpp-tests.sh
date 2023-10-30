#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in cpp/*/; do 
  cd $dir;
  mkdir -p build
  cd build
  cmake -G "Unix Makefiles" ..
  make
  cd $CUR_PATH;
done
