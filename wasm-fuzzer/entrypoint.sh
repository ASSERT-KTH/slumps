#!/bin/bash

# Initial script: https://docs.docker.com/config/containers/multi-service_container/

# Start the first process
$DOCKER_SWAM_SRC/entrypoint_mill_server.sh & disown
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_first_process: $status"
  exit $status
fi

# Start the second process
$DOCKER_INTERFACE_SRC/entrypoint_afl.sh & disown
status=$?
if [ $status -ne 0 ]; then
  echo "Failed to start my_second_process: $status"
  exit $status
fi

# Naive check runs checks once a minute to see if either of the processes exited.
# This illustrates part of the heavy lifting you need to do if you want to run
# more than one service in a container. The container exits with an error
# if it detects that either of the processes has exited.
# Otherwise it loops forever, waking up every 30 seconds

while sleep 30s; do
  ps aux | grep entrypoint_mill_server.sh |grep -q -v grep
  MILL_STATUS=$?
  ps aux | grep entrypoint_afl.sh |grep -q -v grep
  AFL_STATUS=$?
  # If the greps above find anything, they exit with 0 status
  # If they are not both 0, then something is wrong
  if [ $MILL_STATUS -ne 0 -o $AFL_STATUS -ne 0 ]; then
    echo "One of the processes has already exited."
    echo "mill status: $MILL_STATUS"
    echo "afl status: $AFL_STATUS"
    exit 1
  fi
done
