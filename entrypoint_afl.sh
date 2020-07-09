#!/bin/bash

cd $INTERFACE_PATH

PREPARED_INPUT_PATH="$AFL_INPUT_DOCKER/prepared_input.dat"
./prepare_wasm_input.out $PREPARED_INPUT_PATH
REQUIRED_BYTES=$(./getFileSize.out $PREPARED_INPUT_PATH)

afl-fuzz -i $AFL_INPUT_DOCKER -o $AFL_OUTPUT_DOCKER -m none -d -- "${INTERFACE_PATH}interface.out" @@ $REQUIRED_BYTES
