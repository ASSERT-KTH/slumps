#!/bin/bash

# For testing the integration of prepare_wasm_input.cpp and socket_client.cpp.

# Configured for fibo.wat.

# Run server in Swam first:
# >> mill -i cli.run run_server --wat --argType Int64 --main naive --out ./ /Users/vincent/not_in_cloud/Codes/KTH/swam/examples/docs/fibo.wat

export WASM_ARG_TYPES_LIST=Int64
export WASM_ARG_LIST=8

g++ -o prepare_wasm_input.out prepare_wasm_input.cpp utils.cpp
./prepare_wasm_input.out

g++ -o socket_client.out socket_client.cpp utils.cpp
./socket_client.out
