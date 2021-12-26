#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in javascript/*/; do 
  cd $dir;
  npm install
  npm test
  cd $CUR_PATH;
done
