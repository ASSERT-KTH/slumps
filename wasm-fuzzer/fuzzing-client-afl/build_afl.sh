#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PARENT_DIR="$(dirname "$CURRENT_DIR")"
source $PARENT_DIR/logging_lib.sh
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"  # Has to be run again

cd $PARENT_DIR

if [ ! -d aflpp ]; then
    log_info "Downloading aflplusplus..."
    git clone https://github.com/AFLplusplus/AFLplusplus.git aflpp

    log_info "Building aflplusplus..."
    cd aflpp
    make distrib
    sudo make install

fi
