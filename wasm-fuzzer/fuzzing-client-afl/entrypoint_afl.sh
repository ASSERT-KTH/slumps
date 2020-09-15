#!/bin/bash

# For this file to be runnable by itself, use prepare_env.sh & $SWAM_CMD infer signature.
# However, infer signature is already being run in wafl.sh - therefore take it out there first 
# and run it directly in SWAM.

check_output_dir() {
    # AFL Docs on re-starting:
    # If you need to stop and re-start the fuzzing, use the same command line
    # options (or even change them by selecting a different power schedule
    # or another mutation mode!) and switch the input directory with a
    # dash (-): afl-fuzz -i - -o output -- bin/target -d @@

    DIR_NAME=$1
    
    # Check if AFL has already produced results
    if [ -d $DIR_NAME ] && [ "$(ls -A $DIR_NAME)" ]; then
        # Prevent to delete old findings). Useful if AFL/SWAM may crash and auto-restart.
        echo "$DIR_NAME exists and is not empty, so continuing where we left off!"
        INPUT_AFL_DIR="-"
    else
        echo "$DIR_NAME does not exist or is empty - starting fresh run!"
    fi
}

# So that this script can be run by itself as 
# well (same commands as wafl.sh)
if [[ $ENV_PREPARED != "True" ]]; then
    echo "Preparing environment!"
    source $CURRENT_DIR/prepare_env.sh $@
fi

cd $SRC_INTERFACE_DIR

$OUT_INTERFACE_DIR/prepare_wasm_input.out "$INPUT_AFL_DIR/prepared_input.dat"

# TODO: Remove everything related to REQUIRED_BYTES
REQUIRED_BYTES=$($OUT_INTERFACE_DIR/getFileSize.out $INPUT_AFL_DIR/prepared_input.dat)

# Parallel fuzzing: https://github.com/mirrorer/afl/blob/master/docs/parallel_fuzzing.txt
if [[ ! -z "$MASTER_AFL_NODE" ]]; then

    # AFL is going to write into $OUTPUT_AFL_DIR/$WAFL_INSTANCE_ID

    if [[ $MASTER_AFL_NODE == "True" ]]; then
        RANK="-M $WAFL_INSTANCE_ID"
    elif [[ $MASTER_AFL_NODE == "False" ]]; then
        RANK="-S $WAFL_INSTANCE_ID"
    fi

    check_output_dir $OUTPUT_AFL_DIR/$WAFL_INSTANCE_ID
else
    check_output_dir $OUTPUT_AFL_DIR
fi

$OUT_INTERFACE_DIR/wait_for_server.out

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

echo "$BIN_AFL -i $INPUT_AFL_DIR -o $OUTPUT_AFL_DIR $RANK -d -- ${OUT_INTERFACE_DIR}/interface.out @@ $REQUIRED_BYTES"
exec $BIN_AFL -i "$INPUT_AFL_DIR" -o $OUTPUT_AFL_DIR $RANK -d -- "${OUT_INTERFACE_DIR}/interface.out" @@ $REQUIRED_BYTES
