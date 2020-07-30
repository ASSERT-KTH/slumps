#!/bin/bash

cd $DOCKER_INTERFACE_SRC

PREPARED_INPUT_PATH="$DOCKER_AFL_INPUT/prepared_input.dat"
./prepare_wasm_input.out $PREPARED_INPUT_PATH
REQUIRED_BYTES=$(./getFileSize.out $PREPARED_INPUT_PATH)

# Parallel fuzzing: https://github.com/mirrorer/afl/blob/master/docs/parallel_fuzzing.txt
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

# AFL Docs:
# afl-fuzz starts by performing an array of deterministic fuzzing steps, 
# which can take several days, but tend to produce neat test cases. 
# If you want quick & dirty results right away - akin to zzuf and other 
# traditional fuzzers - add the -d option to the command line.

echo "afl-fuzz -i $DOCKER_AFL_INPUT -o $DOCKER_AFL_OUTPUT $RANK -d -- ${DOCKER_INTERFACE_SRC}/interface.out @@ $REQUIRED_BYTES"
afl-fuzz -i $DOCKER_AFL_INPUT -o $DOCKER_AFL_OUTPUT $RANK -d -- "${DOCKER_INTERFACE_SRC}/interface.out" @@ $REQUIRED_BYTES
