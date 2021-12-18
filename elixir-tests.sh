#!/bin/bash

set -e

export MIX_ENV=test
CUR_PATH=`pwd`

for dir in elixir/*/; do 
  cd $dir;
  mix deps.get;
  mix test;
  cd $CUR_PATH;
done
