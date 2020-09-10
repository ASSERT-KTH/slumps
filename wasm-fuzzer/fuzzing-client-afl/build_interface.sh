#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo "Building the wafl interface..."

mkdir -p $CURRENT_DIR/../wafl-temp
CPP_OUT_DIR=$CURRENT_DIR/../wafl-temp/cpp-out
mkdir -p $CPP_OUT_DIR

g++ -o $CPP_OUT_DIR/prepare_wasm_input.out ./fuzzing-client-afl/prepare_wasm_input.cpp ./fuzzing-client-afl/utils.cpp
g++ -o $CPP_OUT_DIR/getFileSize.out ./fuzzing-client-afl/getFileSize.cpp ./fuzzing-client-afl/utils.cpp
g++ -o $CPP_OUT_DIR/wait_for_server.out ./fuzzing-client-afl/wait_for_server.cpp ./fuzzing-client-afl/utils.cpp ./fuzzing-client-afl/socket_client.cpp
g++ -o $CPP_OUT_DIR/run_client.out ./fuzzing-client-afl/run_client.cpp ./fuzzing-client-afl/socket_client.cpp ./fuzzing-client-afl/utils.cpp
g++ -o $CPP_OUT_DIR/interface.out ./fuzzing-client-afl/interface.cpp ./fuzzing-client-afl/socket_client.cpp ./fuzzing-client-afl/utils.cpp
