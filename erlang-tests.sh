#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in erlang/*/; do 
  cd $dir;
  rebar3 eunit;
  cd $CUR_PATH;
done
