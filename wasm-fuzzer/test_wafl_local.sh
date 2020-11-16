#!/bin/bash

# This script makes use of the environmental variable "STAGING". This causes the supervisord.stagng.conf
# file to be used, which in turn adds an event listener to the AFL & SWAM processes. When one of them
# crash, the event listener can crash supervisord, telling us that something is wrong.

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

set -a
source $CURRENT_DIR/.env
set +a

# Make sure we're starting a fresh test here
rm -R $CURRENT_DIR/wafl-temp

export STAGING=True

$CURRENT_DIR/wafl.sh $@ &

sleep 30s

SUPERVISORD_STATUS=$(ps aux | grep 'supervisor')
log_info "SUPERVISORD_STATUS: $SUPERVISORD_STATUS"
# --> SUPERVISORD_STATUS: 
# root      5860  0.0  0.2  65660 20816 ?        Ss   15:31   0:00 /usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf 148
# runner   20155  0.0  0.0  11404   588 ?        R    15:39   0:00 grep supervisor 149
# runner   29606  0.4  0.2  65456 20736 ?        S    15:39   0:00 /usr/bin/python /usr/bin/supervisord -c /home/runner/work/slumps/slumps/wasm-fuzzer/supervisord.staging.conf

# SUPERVISORD_PID=$(pgrep -o -x supervisord)
SUPERVISORD_PID=$(pgrep -o -f 'supervisord.staging.conf')
log_info "SUPERVISORD_PID: $SUPERVISORD_PID"

if [ -z "$SUPERVISORD_PID" ]
then
    log_error "supervisord process is not running anymore. It must have crashed."
    exit 1
else
    log_info "supervisord process is still running. We're good!"
    kill $SUPERVISORD_PID
    exit 0
fi
