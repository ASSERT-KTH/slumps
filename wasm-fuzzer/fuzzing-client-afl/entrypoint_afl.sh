#!/bin/bash

cd $DOCKER_INTERFACE_SRC

PREPARED_INPUT_PATH="$DOCKER_AFL_INPUT/prepared_input.dat"
./prepare_wasm_input.out $PREPARED_INPUT_PATH
REQUIRED_BYTES=$(./getFileSize.out $PREPARED_INPUT_PATH)

./wait_for_server.out

if [ $? != 0 ]; then
    exit 1
fi

echo "afl-fuzz -i $DOCKER_AFL_INPUT -o $DOCKER_AFL_OUTPUT -m none -d -- ${DOCKER_INTERFACE_SRC}/interface.out @@ $REQUIRED_BYTES"
afl-fuzz -i $DOCKER_AFL_INPUT -o $DOCKER_AFL_OUTPUT -m none -d -- "${DOCKER_INTERFACE_SRC}/interface.out" @@ $REQUIRED_BYTES
