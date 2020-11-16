#!/bin/bash

# This script will only send the SWAM server a single message, to check 
# whether it is sent correctly. It is meant to be used locally for quick testing.

# This script requires SWAM to be up and running.
#   Option A: Use `./entrypoint_mill_server.sh` after `$CURRENT_DIR/prepare_env.sh $@`
#   Option B: Launch manually (example fibo.wat):
#       mill -i cli_server.run run_server --wat  --main naive <path_to_fibo.wat>
#       mill -i cli_server.run run_server --wasi --main a wasm-fuzzer/sample-testing-targets/branches2.wasm

# Run this script as `./test_socket.sh branches2.wasm a 11`

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

#############
### Build ###
#############

# AFL is not required for this.

$CURRENT_DIR/fuzzing-client-afl/build_interface.sh

###########
### Run ###
###########

source $CURRENT_DIR/prepare_env.sh $@  # Taking "branches2.wasm a 11"

log_info "Inferring signature for wasm"
log_info "Running: $SWAM_CLI_CMD infer $WAT_ARG $WASM_OR_WAT_FILE $TARGET_FUNCTION"
export WASM_ARG_TYPES_CSV=$($SWAM_CLI_CMD infer $WAT_ARG $WASM_OR_WAT_FILE $TARGET_FUNCTION) # Read from signature retriever
pkill -f out.jar

$OUT_INTERFACE_DIR/prepare_wasm_input.out "$OUT_INTERFACE_DIR/prepared_input.dat"
$OUT_INTERFACE_DIR/run_client.out "$OUT_INTERFACE_DIR/prepared_input.dat"
