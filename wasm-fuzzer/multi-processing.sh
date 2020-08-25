#!/bin/bash

if [ -z "$1" ]
then
    echo "Specifiy the number of AFL instances as argument!"
    exit 1
fi

echo "Running $1 AFL instance(s)."

set -a
source ./.env
set +a

echo "Running #1"
docker run --env-file=./.env \
    -e SWAM_SOCKET_HOST=localhost \
    -e MASTER_AFL_NODE=True \
    -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
    -v compiled_sources:/home/server/src/out/ \
    -v ${LOCAL_WASM:?err}:/home/server/wasm/ \
    -v ${LOCAL_AFL_OUTPUT:?err}:/home/client/out/ \
    -v ${LOCAL_LOGS:?err}:/home/shared/logs/ \
    -d \
    slumps/wafl:latest

if [ $1 -lt 2 ]
then
    exit 0
fi

for i in $(seq 2 $1)
do 
    echo "Waiting for previous mill server to compile..."
    sleep 30s
    echo "Running #${i}"
    docker run --env-file=./.env \
        -e SWAM_SOCKET_HOST=localhost \
        -e MASTER_AFL_NODE=False \
        -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
        -v compiled_sources:/home/server/src/out/ \
        -v ${LOCAL_WASM:?err}:/home/server/wasm/ \
        -v ${LOCAL_AFL_OUTPUT:?err}:/home/client/out/ \
        -v ${LOCAL_LOGS:?err}:/home/shared/logs/ \
        -d \
        slumps/wafl:latest
done
exit 0
