#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in rust/*/; do 
  cd $dir;
  cargo test
  cd $CUR_PATH;
done
