#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in lua/*/; do 
  cd $dir;
  luacheck . --std max+busted
  busted
  cd $CUR_PATH;
done
