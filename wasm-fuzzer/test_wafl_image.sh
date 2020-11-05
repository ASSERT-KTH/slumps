#!/bin/bash

# This script makes use of the environmental variable "STAGING". This causes the supervisord.stagng.conf
# file to be used, which in turn adds an event listener to the AFL & SWAM processes. When one of them
# crash, the event listener can crash supervisord (the main process) and thereby crash the container, 
# telling us that something is wrong. Otherwise supervisord would just continue running (with or without 
# restarting the crashed process).

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

set -a
source $CURRENT_DIR/.env
set +a

# Make sure we're starting a fresh test here
rm -R $CURRENT_DIR/wafl-temp

docker run -d --rm --env-file=${CURRENT_DIR}/.env \
    -e STAGING=True \
    --name=staging_wafl \
    -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
    -v compiled_sources:/home/server/src/out/ \
    -v ${LOCAL_WASM_DIR:?err}:/home/server/wasm/ \
    -v ${CURRENT_DIR}/wafl-temp/afl-out:/home/client/out/ \
    -v ${CURRENT_DIR}/wafl-temp/logs:/home/shared/logs/ \
    wafl:latest $@

sleep 30s

CONTAINER_STATUS=$(docker container inspect -f '{{.State.Status}}' staging_wafl)
log_info "CONTAINER_STATUS: $CONTAINER_STATUS"

if [[ $CONTAINER_STATUS != "running" ]]; then
    log_error "staging_wafl container is not running anymore. It must have crashed."
    exit 1
else
    log_info "staging_wafl container is still running. We're good!"
    docker stop staging_wafl
    exit 0
fi
