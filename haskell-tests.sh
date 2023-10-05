#!/bin/bash
set -e

CUR_PATH=`pwd`

stack install hlint

for dir in haskell/*/; do 
  cd $dir;
  hlint src/
  stack test
  cd $CUR_PATH;
done
