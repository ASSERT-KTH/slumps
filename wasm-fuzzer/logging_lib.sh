#!/bin/bash

declare -a _log_levels=([ERROR]=0 [WARNING]=1 [INFO]=2 [DEBUG]=3)
declare -i _log_level=3
set_log_level() {
  level="${1:-INFO}"
  _log_level="${_log_levels[$level]}"
}

log_execute() {
  level=${1:-INFO}
  if (( $1 >= ${_log_levels[$level]} )); then
    "${@:2}" >/dev/null
  else
    "${@:2}"
  fi
}

log_error()   { (( _log_level >= ${_log_levels[ERROR]} ))   && echo "$(date) ERROR      $*";  }
log_warning() { (( _log_level >= ${_log_levels[WARNING]} )) && echo "$(date) WARNING    $*";  }
log_info()    { (( _log_level >= ${_log_levels[INFO]} ))    && echo "$(date) INFO       $*";  }
log_debug()   { (( _log_level >= ${_log_levels[DEBUG]} ))   && echo "$(date) DEBUG      $*";  }

# functions for logging command output
log_debug_file()   { (( _log_level >= ${_log_levels[DEBUG]} ))   && [[ -f $1 ]] && echo "=== command output start ===" && cat "$1" && echo "=== command output end ==="; }

# Initialise:

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

set_log_level $LOG_LEVEL
