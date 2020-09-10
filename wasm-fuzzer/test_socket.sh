#!/bin/bash

# This script will only send the SWAM server a single message, to check whether it is sent correctly.
# This requires SWAM to be up and running.

# Run as `./test_socket.sh branches2.wasm a 11`

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

echo "Infering signature for wasm"
echo "$SWAM_CMD infer $WAT_ARG $WASM_OR_WAT_FILE $TARGET_FUNCTION"
export WASM_ARG_TYPES_CSV=$($SWAM_CMD infer $WAT_ARG $WASM_OR_WAT_FILE $TARGET_FUNCTION)
pkill -f out.jar

CPP_OUT_DIR=$CURRENT_DIR/wafl-temp/cpp-out

$CPP_OUT_DIR/prepare_wasm_input.out "$CPP_OUT_DIR/prepared_input.dat"
$CPP_OUT_DIR/run_client.out "$CPP_OUT_DIR/prepared_input.dat"
