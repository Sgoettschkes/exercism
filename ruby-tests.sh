#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in ruby/*/; do 
  cd $dir;
  RUBYTESTFILE=`find "." -type f -name "*_test.rb"`;
  ruby $RUBYTESTFILE;
  cd $CUR_PATH;
done
