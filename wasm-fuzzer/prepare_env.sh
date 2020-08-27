#!/bin/bash

currentID=$$
echo "wafl ID $currentID"

set -a
source ../.env
set +a

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# Check if inside Docker: https://stackoverflow.com/a/25518345/9068781
if ! [ -f /.dockerenv ]; then
    echo "Not inside a Docker container";

    TEMP_DIR=$CURRENT_DIR/wafl-temp

    export SRC_INTERFACE_DIR=$CURRENT_DIR/fuzzing-client-afl
    export SRC_SWAM_DIR=$CURRENT_DIR/fuzzing-server-swam

    export INPUT_AFL_DIR=$TEMP_DIR/afl-input/$currentID
    export OUTPUT_AFL_DIR=$TEMP_DIR/afl-output/$currentID

    export LOGS_DIR=$TEMP_DIR/logs/$currentID

    export WASM_OR_WAT_FILE=$1

    export BIN_AFL="$CURRENT_DIR/aflpp/afl-fuzz"
    export SWAM_CMD="java -jar $SRC_SWAM_DIR/out/cli/assembly/dest/out.jar"

    mkdir -p $INPUT_AFL_DIR
    mkdir -p $OUTPUT_AFL_DIR
    mkdir -p $LOGS_DIR
else
    echo "Inside a Docker container - env's are pre-defined";

    # Get filename from $1
    export WASM_OR_WAT_FILE=$WASM_DIR/$(basename $1)
    
    export SWAM_CMD='mill cli.run'
fi

# TODO: Make this CLI-dependent
export WASI_FILTER=True
export WASI=True

# TODO: Check if empty
export TARGET_FUNCTION=$2
export WASM_ARG_CSV=$3

export ENV_PREPARED=True
