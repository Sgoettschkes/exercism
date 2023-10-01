#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in gleam/*/; do 
  cd $dir;
  gleam format --check
  gleam test
  cd $CUR_PATH;
done
