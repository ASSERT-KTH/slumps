#!/bin/bash

# TODO: Put this file back into the SWAM repo

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

# So that this script can be run by itself as 
# well (same commands as wafl.sh)
if [[ $ENV_PREPARED != "True" ]]; then
    source $CURRENT_DIR/prepare_env.sh $@
fi

# Get wasm/wat from $WASM_DIR directory
log_info "WASM_OR_WAT_FILE: $WASM_OR_WAT_FILE"

if [[ $WASI == "True" ]]; then WASI_ARG="--wasi"; fi
if [[ $WASI_FILTER == "True" ]]; then WASI_ARG="$WASI_ARG -r"; fi

cd $SRC_SWAM_DIR

LOGGING_ARG="1> $LOGS_DIR/swam.std.txt 2> $LOGS_DIR/swam.err.txt &"

log_info "Running: $SWAM_CMD run_server $WASM_OR_WAT_FILE --main $TARGET_FUNCTION $WAT_ARG $WASI_ARG $LOGGING_ARG"
exec $SWAM_CMD run_server $WASM_OR_WAT_FILE --main $TARGET_FUNCTION $WAT_ARG $WASI_ARG 1> $LOGS_DIR/swam.std.txt 2> $LOGS_DIR/swam.err.txt
