#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

log_info "Building SWAM"
./fuzzing-server-swam/millw cli.assembly

bash $CURRENT_DIR/fuzzing-client-afl/build_interface.sh
bash $CURRENT_DIR/fuzzing-client-afl/build_afl.sh

log_info "Finished building WAFL"
