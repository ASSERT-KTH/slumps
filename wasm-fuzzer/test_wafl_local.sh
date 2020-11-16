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
#   root      5504  0.0  0.2  65572 20668 ?        Ss   23:21   0:00 /usr/bin/python /usr/bin/supervisord -n -c /etc/supervisor/supervisord.conf
#   runner   26235  0.0  0.0  14848   988 ?        S    23:30   0:00 grep supervisor

SUPERVISORD_PID=$(pgrep -x supervisord)
log_info "SUPERVISORD_PID: $SUPERVISORD_PID"

if $SUPERVISORD_PID > /dev/null
then
    log_info "supervisord process is still running. We're good!"
    kill $SUPERVISORD_PID
    exit 0
else
    log_error "supervisord process is not running anymore. It must have crashed."
    exit 1
fi
