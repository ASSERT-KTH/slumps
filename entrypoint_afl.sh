#!/bin/bash

# Run server in Swam first (example with fibo.wat):
# >> mill -i cli.run run_server --wat --argType Int64 --main naive --out ./ /Users/vincent/not_in_cloud/Codes/KTH/swam/examples/docs/fibo.wat

cd /src/

# TODO: Put this into build of new image with AFLPlusPlus as base
g++ -o ./prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
g++ -o ./getFileSize.out ./getFileSize.cpp ./utils.cpp
g++ -o ./interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp

PREPARED_INPUT_PATH="./prepared_input.dat"
./prepare_wasm_input.out $PREPARED_INPUT_PATH
REQUIRED_BYTES=$(./getFileSize.out $PREPARED_INPUT_PATH)

afl-fuzz -i /src/in -o out -m none -d -- /src/interface.out @@ $REQUIRED_BYTES
