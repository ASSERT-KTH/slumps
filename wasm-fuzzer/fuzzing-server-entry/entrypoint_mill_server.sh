#!/bin/bash

# TODO: Put this file back into the SWAM repo

# TODO: Put this into entrypoint_afl.sh as well as soon as the server infers the signature itself.
# So that this script can be run by itself as 
# well (same commands as wafl.sh)
if [[ ENV_PREPARED != "True" ]]; then
    echo "Preparing environment!"
    source ../prepare_env.sh $@
fi

# Get wasm/wat from $WASM_DIR directory
echo "WASM_OR_WAT_FILE: $WASM_OR_WAT_FILE"

# Parse WASM_ARG_TYPES_CSV: "Int64,Int32" to "--argType Int64 --argType Int32"
ALL_ARG_TYPES=""
IFS=',' read -r -a WASM_ARG_TYPES_ARRAY <<<"$WASM_ARG_TYPES_CSV"
for element in "${WASM_ARG_TYPES_ARRAY[@]}"; do
    ALL_ARG_TYPES="$ALL_ARG_TYPES --argType $element"
done
echo "ALL_ARG_TYPES: $ALL_ARG_TYPES"

if [[ $WASM_OR_WAT_FILE == *.wat ]]; then WAT_ARG="--wat"; fi
if [[ $WASI == "True" ]]; then WASI_ARG="--wasi"; fi
if [[ $WASI_FILTER == "True" ]]; then WASI_ARG="$WASI_ARG -r"; fi

cd $SRC_SWAM_DIR

LOGGING_ARG="1> $LOGS_DIR/swam.std.txt 2> $LOGS_DIR/swam.err.txt &"

echo "$SWAM_CMD run_server $WASM_OR_WAT_FILE --main $TARGET_FUNCTION $WAT_ARG $WASI_ARG $ALL_ARG_TYPES $LOGGING_ARG"
exec $SWAM_CMD run_server $WASM_OR_WAT_FILE --main $TARGET_FUNCTION $WAT_ARG $WASI_ARG $ALL_ARG_TYPES $LOGGING_ARG
