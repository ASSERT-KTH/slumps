#!/bin/bash

# For testing the integration of prepare_wasm_input.cpp and socket_client.cpp.

# Run server in Swam first (example with fibo.wat):
# >> mill -i cli.run run_server --wat --argType Int64 --main naive --out ./ /Users/vincent/not_in_cloud/Codes/KTH/swam/examples/docs/fibo.wat

# Configured for fibo.wat:
export WASM_ARG_TYPES_LIST=Int64
export WASM_ARG_LIST=15

mkdir -p ./cpp_out

g++ -o ./cpp_out/prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
g++ -o ./cpp_out/run_client.out ./run_client.cpp ./socket_client.cpp ./utils.cpp

./cpp_out/prepare_wasm_input.out "./cpp_out/prepared_input.dat"
./cpp_out/run_client.out "./cpp_out/prepared_input.dat"
