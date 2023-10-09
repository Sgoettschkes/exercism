#!/bin/bash
set -e

CUR_PATH=`pwd`

for dir in python/*/; do 
  cd $dir;
  PYFILE=`find "." -type f -name "*.py" -not -name "*_test.py"`
  python3 -m pylint $PYFILE --rcfile $CUR_PATH/python/pylintrc
  python3 -m pytest -o markers=task
  cd $CUR_PATH;
done
