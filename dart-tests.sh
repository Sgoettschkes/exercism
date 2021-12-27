#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in dart/*/; do 
  cd $dir;
  dart test
  cd $CUR_PATH;
done
