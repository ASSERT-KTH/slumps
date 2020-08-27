#!/bin/bash

source ./prepare_env.sh $@

# TODO: Put this into entrypoint_afl.sh + call function directly in Scala at server startup
echo "Infering signature for wasm"
echo "$SWAM_CMD infer $WAT_ARG $WASM_OR_WAT_FILE $TARGET_FUNCTION"
export WASM_ARG_TYPES_CSV=$($SWAM_CMD infer $WAT_ARG $WASM_OR_WAT_FILE $TARGET_FUNCTION) # Read from signature retriever
pkill -f out.jar

/usr/bin/supervisord -c ./supervisord.conf
