#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
source $CURRENT_DIR/logging_lib.sh

log_info "Downloading SWAM"
cd $CURRENT_DIR/fuzzing-server-swam
# ./millw cli.assembly

curl -o swam_cli.jar -L https://github.com/KTH/swam/releases/download/v0.6.0-RC3/swam_cli.jar
curl -o swam_server.jar -L https://github.com/KTH/swam/releases/download/v0.6.0-RC3/swam_server.jar

bash $CURRENT_DIR/fuzzing-client-afl/build_interface.sh
bash $CURRENT_DIR/fuzzing-client-afl/build_afl.sh

log_info "Finished building WAFL"
