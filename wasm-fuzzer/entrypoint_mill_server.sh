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

######################################################################
### TODO: Remove this as soon as sig is infered directly in Server ###
######################################################################

# Parse WASM_ARG_TYPES_CSV: "Int64,Int32" to "--argType Int64 --argType Int32"
ALL_ARG_TYPES=""
IFS=',' read -r -a WASM_ARG_TYPES_ARRAY <<<"$WASM_ARG_TYPES_CSV"
for element in "${WASM_ARG_TYPES_ARRAY[@]}"; do
    ALL_ARG_TYPES="$ALL_ARG_TYPES --argType $element"
done
log_info "ALL_ARG_TYPES: $ALL_ARG_TYPES"

######################################################################
######################################################################
######################################################################

if [[ $WASI == "True" ]]; then WASI_ARG="--wasi"; fi
if [[ $WASI_FILTER == "True" ]]; then WASI_ARG="$WASI_ARG -r"; fi

cd $SRC_SWAM_DIR

LOGGING_ARG="1> $LOGS_DIR/swam.std.txt 2> $LOGS_DIR/swam.err.txt &"

log_info "Running: $SWAM_CMD run_server $WASM_OR_WAT_FILE --main $TARGET_FUNCTION $WAT_ARG $WASI_ARG $ALL_ARG_TYPES $LOGGING_ARG"
exec $SWAM_CMD run_server $WASM_OR_WAT_FILE --main $TARGET_FUNCTION $WAT_ARG $WASI_ARG $ALL_ARG_TYPES 1> $LOGS_DIR/swam.std.txt 2> $LOGS_DIR/swam.err.txt
