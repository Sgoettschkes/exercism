#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in javascript/*/; do 
  cd $dir;
  npm install
  npm run lint
  npm test
  cd $CUR_PATH;
done
