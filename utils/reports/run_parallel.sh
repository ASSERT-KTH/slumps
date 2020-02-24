#!/bin/bash
programs=(a bc d e f)
steps=$((${#programs[@]}))  
QUEUE_SIZE=1
START=0

for ((i=START; i<=steps; i++)); do
    idx=$((i))

    if ! ((idx % $QUEUE_SIZE)); then
        echo "wait" $idx
        wait
    
    echo ${programs[idx]}
    sleep 2 &
        # echo "work" $idx
    fi
done