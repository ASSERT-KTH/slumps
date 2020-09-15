#!/bin/bash

# TODO: Test this

# This script makes use of the environmental variable "STAGING". This causes the supervisord.stagng.conf
# file to be used, which in turn adds an event listener to the AFL & SWAM processes. When one of them
# crash, the event listener can crash supervisord, telling us that something is wrong.

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

set -a
source $CURRENT_DIR/.env
set +a

# Make sure we're starting a fresh test here
rm -R $CURRENT_DIR/wafl-temp

export STAGING=True

$CURRENT_DIR/wafl.sh $@

sleep 30s

# TODO: Check if this works
SUPERVISORD_STATUS=$(ps aux | grep 'supervisor')
echo "SUPERVISORD_STATUS: $SUPERVISORD_STATUS"

if ! [ $SUPERVISORD_STATUS ]; then
    echo "supervisord process is not running anymore. It must have crashed."
    exit 1
else
    echo "supervisord process is still running. We're good!"
    # TODO: Kill supervisord
    exit 0
fi
