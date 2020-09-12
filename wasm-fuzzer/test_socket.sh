#!/bin/bash

# This script will only send the SWAM server a single message, to check 
# whether it is sent correctly. It is meant to be used locally for quick testing.

# This script requires SWAM to be up and running.
#   Option A: Use `./entrypoint_mill_server.sh` after `$CURRENT_DIR/prepare_env.sh $@`
#   Option B: Launch manually (example fibo.wat):
#       mill -i cli.run run_server --wat --argType Int64  \
#           --main naive --out ./ <path_to_fibo.wat>

# Run this script as `./test_socket.sh branches2.wasm a 11`

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

#############
### Build ###
#############

# AFL is not required for this.

$CURRENT_DIR/fuzzing-client-afl/build_interface.sh

###########
### Run ###
###########

source $CURRENT_DIR/prepare_env.sh $@  # Taking "branches2.wasm a 11"

CPP_OUT_DIR=$CURRENT_DIR/wafl-temp/cpp-out

$CPP_OUT_DIR/prepare_wasm_input.out "$CPP_OUT_DIR/prepared_input.dat"
$CPP_OUT_DIR/run_client.out "$CPP_OUT_DIR/prepared_input.dat"
