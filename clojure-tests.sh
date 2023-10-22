#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in clojure/*/; do 
  cd $dir;
  clj -X:test
  cd $CUR_PATH;
done
