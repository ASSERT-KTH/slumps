#! /bin/bash
redis-server

SOURCE=$(dirname $BASH_SOURCE)

echo $SOURCE
export DYLD_LIBRARY_PATH=$SOURCE/souper/third_party/z3-install/lib

python3.7 $SOURCE/crow/slumps.py $@
