#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

log_info "Starting to prepare environment!"

REQUIRED_ARGUMENTS_MESSAGE="The following 3 arguments are required:
    1.
        a) Using Docker: .wasm/.wat filename
        b) Without Docker: .wasm/.wat filepath
    2. target function in .wasm/.wat file
    3. seed arguments csv
        e.g. 13,16.9,0
    
    Example: ${CURRENT_DIR}/sample-testing-targets/branches2.wasm a 11
"

if [ "$#" -ne 3 ]; then
    log_error "Incorrect amount of arguments ($# were given). $REQUIRED_ARGUMENTS_MESSAGE"
    exit 1
fi

if [ -z "$WAFL_INSTANCE_ID" ]; then
    export WAFL_INSTANCE_ID=$((1 + RANDOM % 99999999))
fi
log_info "wafl ID $WAFL_INSTANCE_ID"

# Check if inside Docker: https://stackoverflow.com/a/25518345/9068781
if ! [ -f /.dockerenv ]; then
    log_info "Not inside a Docker container"

    set -a
    source $CURRENT_DIR/.env
    set +a

    TEMP_DIR=$CURRENT_DIR/wafl-temp

    mkdir -p $TEMP_DIR/afl-in
    mkdir -p $TEMP_DIR/afl-out
    mkdir -p $TEMP_DIR/logs

    export SRC_INTERFACE_DIR=$CURRENT_DIR/fuzzing-client-afl
    export SRC_SWAM_DIR=$CURRENT_DIR/fuzzing-server-swam

    export OUT_INTERFACE_DIR=$TEMP_DIR/cpp-out

    export INPUT_AFL_DIR=$TEMP_DIR/afl-in/$WAFL_INSTANCE_ID
    export OUTPUT_AFL_DIR=$TEMP_DIR/afl-out

    export LOGS_DIR=$TEMP_DIR/logs/$WAFL_INSTANCE_ID

    export WASM_OR_WAT_FILE=$1

    export BIN_AFL="$CURRENT_DIR/aflpp/afl-fuzz"
    JAVA=$(which java)
    export SWAM_CLI_CMD="$JAVA -jar $SRC_SWAM_DIR/out/cli/assembly/dest/out.jar"
    export SWAM_SERVER_CMD="$JAVA -jar $SRC_SWAM_DIR/out/cli_server/assembly/dest/out.jar"

    mkdir -p $INPUT_AFL_DIR
    mkdir -p $OUTPUT_AFL_DIR
    mkdir -p $LOGS_DIR
else
    log_info "Inside a Docker container - env's are pre-defined"

    # Get filename from $1
    export WASM_OR_WAT_FILE=$WASM_DIR/$(basename $1)

    # export SWAM_CLI_CMD='mill cli.run'
    # export SWAM_SERVER_CMD='mill cli_server.run'

    # TODO: Replace SWAM_CMD with SWAM_CLI_CMD & SWAM_SERVER_CMD
    JAVA=$(which java)
    export SWAM_CMD="$JAVA -jar $SRC_SWAM_DIR/cli-0.6.0-RC3.jar"
fi

if [ ! -f $WASM_OR_WAT_FILE ]; then
    log_error "File $WASM_OR_WAT_FILE not found! $REQUIRED_ARGUMENTS_MESSAGE"
    exit 1
fi

if [[ $WASM_OR_WAT_FILE == *.wat ]]; then
    export WAT_ARG="--wat"
fi

# TODO: Make this CLI-dependent
export WASI_FILTER=True
export WASI=True

export TARGET_FUNCTION=$2
export WASM_ARG_CSV=$3

# This makes sure this script is not run multiple twice
export ENV_PREPARED=True

log_info "Finished preparing environment!"
