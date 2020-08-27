#!/bin/bash

cd $SRC_INTERFACE_DIR

./prepare_wasm_input.out "$INPUT_AFL_DIR/prepared_input.dat"

# TODO: Remove everything related to REQUIRED_BYTES
REQUIRED_BYTES=$(./getFileSize.out $INPUT_AFL_DIR/prepared_input.dat)

# Parallel fuzzing: https://github.com/mirrorer/afl/blob/master/docs/parallel_fuzzing.txt
# TODO: Refactor this to work in non-Docker environment as well
if [[ ! -z "$MASTER_AFL_NODE" ]]
then
    DOCKER_CONTAINER_ID=$(</etc/hostname)
    if [[ $MASTER_AFL_NODE == "True" ]]
    then
        RANK="-M $DOCKER_CONTAINER_ID"
    elif [[ $MASTER_AFL_NODE == "False" ]]
    then
        RANK="-S $DOCKER_CONTAINER_ID"
    fi
fi

./wait_for_server.out

if [ $? != 0 ]; then
    exit 1
fi

if ! [[ $BIN_AFL ]]; then
    BIN_AFL='afl-fuzz'
fi

# AFL Docs:
# afl-fuzz starts by performing an array of deterministic fuzzing steps, 
# which can take several days, but tend to produce neat test cases. 
# If you want quick & dirty results right away - akin to zzuf and other 
# traditional fuzzers - add the -d option to the command line.


echo "$BIN_AFL -i $INPUT_AFL_DIR -o $OUTPUT_AFL_DIR $RANK -d -- ${SRC_INTERFACE_DIR}/interface.out @@ $REQUIRED_BYTES"
$BIN_AFL -i "$INPUT_AFL_DIR" -o $OUTPUT_AFL_DIR $RANK -d -- "${SRC_INTERFACE_DIR}/interface.out" @@ $REQUIRED_BYTES
