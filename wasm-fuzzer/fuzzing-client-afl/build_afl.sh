#!/bin/bash

#err=0
#trap 'err=1' ERR

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
cd $CURRENT_DIR/..


if [ ! -d aflpp ]; then
    echo "Downloading aflplusplus..."
    git clone https://github.com/AFLplusplus/AFLplusplus.git aflpp

    echo "Building aflplusplus..."
    cd aflpp
    make distrib
    sudo make install
    cd ..
fi


#test $err = 0
