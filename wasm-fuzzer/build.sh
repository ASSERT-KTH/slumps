#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo $CURRENT_DIR

echo "Cloning SWAM"
if [ ! -d fuzzing-server-swam ]; then
    git clone --single-branch --branch slumps https://github.com/KTH/swam.git fuzzing-server-swam
fi

echo "Building SWAM"
./fuzzing-server-swam/millw cli.assembly

bash $CURRENT_DIR/fuzzing-client-afl/build_afl.sh
bash $CURRENT_DIR/fuzzing-client-afl/build_interface.sh

echo "Finishing"
