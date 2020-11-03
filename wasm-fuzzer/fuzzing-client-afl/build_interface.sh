#!/bin/bash


err=0
trap 'err=1' ERR

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
PARENT_DIR="$(dirname "$CURRENT_DIR")"

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"  # Has to be run again

echo "Building the wafl interface..."

mkdir -p $PARENT_DIR/wafl-temp
CPP_OUT_DIR=$PARENT_DIR/wafl-temp/cpp-out
mkdir -p $CPP_OUT_DIR

g++ -o $CPP_OUT_DIR/prepare_wasm_input.out $CURRENT_DIR/prepare_wasm_input.cpp $CURRENT_DIR/utils.cpp
g++ -o $CPP_OUT_DIR/getFileSize.out $CURRENT_DIR/getFileSize.cpp $CURRENT_DIR/utils.cpp
g++ -o $CPP_OUT_DIR/wait_for_server.out $CURRENT_DIR/wait_for_server.cpp $CURRENT_DIR/utils.cpp $CURRENT_DIR/socket_client.cpp
g++ -o $CPP_OUT_DIR/run_client.out $CURRENT_DIR/run_client.cpp $CURRENT_DIR/socket_client.cpp $CURRENT_DIR/utils.cpp
g++ -o $CPP_OUT_DIR/interface.out $CURRENT_DIR/interface.cpp $CURRENT_DIR/socket_client.cpp $CURRENT_DIR/utils.cpp

test $err = 0
