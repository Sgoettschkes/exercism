#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in zig/*/; do 
  cd $dir;
  zig test $(ls test_*.zig)
  cd $CUR_PATH;
done
