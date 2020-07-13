#!/bin/bash

cd $INTERFACE_PATH

PREPARED_INPUT_PATH="$INPUT_DOCKER_AFL/prepared_input.dat"
./prepare_wasm_input.out $PREPARED_INPUT_PATH
REQUIRED_BYTES=$(./getFileSize.out $PREPARED_INPUT_PATH)

echo "afl-fuzz -i $INPUT_DOCKER_AFL -o $OUTPUT_DOCKER_AFL -m none -d -- ${INTERFACE_PATH}/interface.out @@ $REQUIRED_BYTES"
afl-fuzz -i $INPUT_DOCKER_AFL -o $OUTPUT_DOCKER_AFL -m none -d -- "${INTERFACE_PATH}/interface.out" @@ $REQUIRED_BYTES
