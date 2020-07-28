#!/bin/bash

# Get wasm/wat from $WASM_PATH_DOCKER directory
WASM_OR_WAT_FILE=${WASM_PATH_DOCKER}/${WASM_EXECUTABLE}
echo "WASM_OR_WAT_FILE: $WASM_OR_WAT_FILE"

# Parse WASM_ARG_TYPES_LIST: "Int64,Int32" to "--argType Int64 --argType Int32"
ALL_ARG_TYPES=""
IFS=',' read -r -a array <<< "$WASM_ARG_TYPES_LIST"
for element in "${array[@]}"
do
    ALL_ARG_TYPES="$ALL_ARG_TYPES --argType $element"
done
echo "ALL_ARG_TYPES: $ALL_ARG_TYPES"

if [[ $WASM_OR_WAT_FILE == *.wat ]]; then WAT_ARG="--wat"; fi
if [[ $WASI == "True" ]]; then WASI_ARG="--wasi"; fi

cd $REPO_PATH_DOCKER

# This also compiles the cli package in case source code / dependencies have changed: 
echo "mill -i cli.run run_server $WAT_ARG $WASI_ARG $ALL_ARG_TYPES --main $TARGET_FUNCTION --out $SWAM_OUTPUT_DOCKER $WASM_OR_WAT_FILE"
mill -i cli.run run_server $WAT_ARG $WASI_ARG $ALL_ARG_TYPES --main $TARGET_FUNCTION --out $SWAM_OUTPUT_DOCKER $WASM_OR_WAT_FILE
