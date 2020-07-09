#!/bin/bash

# REPO_PATH_DOCKER=/home/swam/
# SWAM_OUTPUT_DOCKER=/home/out/
# WASM_PATH_DOCKER=/home/wasm

# Get first wasm/wat from $WASM_PATH_DOCKER directory
WASM_OR_WAT_FILE=""
if [ $WAT == "True" ]; then
    wat_files=( ${WASM_PATH_DOCKER}*.wat )
    WASM_OR_WAT_FILE=${wat_files[0]}
else
    wasm_files=( ${WASM_PATH_DOCKER}*.wasm )
    WASM_OR_WAT_FILE=${wasm_files[0]}
fi
echo "WASM_OR_WAT_FILE: $WASM_OR_WAT_FILE"

# Parse WASM_ARG_TYPES_LIST: "Int64,Int32" to "--argType Int64 --argType Int32"
ALL_ARG_TYPES=""
IFS=',' read -r -a array <<< "$WASM_ARG_TYPES_LIST"
for element in "${array[@]}"
do
    ALL_ARG_TYPES="$ALL_ARG_TYPES --argType $element"
done
echo "ALL_ARG_TYPES: $ALL_ARG_TYPES"

if [ $WAT == "True" ]; then WAT_ARG="--wat"; fi
if [ $WASI == "True" ]; then WASI_ARG="--wasi"; fi

cd $REPO_PATH_DOCKER

mill -i cli.run run_server $WAT_ARG $WASI_ARG $ALL_ARG_TYPES --main $TARGET_FUNCTION --out $SWAM_OUTPUT_DOCKER $WASM_OR_WAT_FILE'
