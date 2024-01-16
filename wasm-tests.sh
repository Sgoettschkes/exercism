#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in wasm/*/; do 
  cd $dir;
  yarn install
  yarn test
  cd $CUR_PATH;
done
