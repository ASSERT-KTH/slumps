#!/bin/bash

# This is the main entrypoint of WAFL with and without Docker

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

source ${CURRENT_DIR}/prepare_env.sh $@

if [[ -z "$STAGING" ]]; then
    SUPERVISOR_CONF=${CURRENT_DIR}/supervisord.conf
else
    SUPERVISOR_CONF=${CURRENT_DIR}/supervisord.staging.conf
fi

SUPERVISORD_BIN=$(which supervisord)

exec $SUPERVISORD_BIN -c $SUPERVISOR_CONF
