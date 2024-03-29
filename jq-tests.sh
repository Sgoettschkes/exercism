#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in jq/*/; do 
  cd $dir;
  BATSFILE=`find "." -type f -name "*.bats"`;
  bats $BATSFILE;
  cd $CUR_PATH;
done
