#!/bin/bash

# Get wasm/wat from $DOCKER_WASM directory
WASM_OR_WAT_FILE=${DOCKER_WASM}/${WASM_EXECUTABLE}
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

cd $DOCKER_SWAM_SRC

# This also compiles the cli package in case source code / dependencies have changed: 
echo "java -jar cli-0.6.0-RC3.jar run_server $WAT_ARG $WASI_ARG $ALL_ARG_TYPES --main $TARGET_FUNCTION $WASM_OR_WAT_FILE"
exec java -jar cli-0.6.0-RC3.jar $WAT_ARG $WASI_ARG $ALL_ARG_TYPES --main $TARGET_FUNCTION $WASM_OR_WAT_FILE
