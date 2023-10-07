#!/bin/bash
set -e


CUR_PATH=`pwd`

for dir in python/*/; do 
  cd $dir;
  python3 -m pytest -o markers=task
  cd $CUR_PATH;
done
