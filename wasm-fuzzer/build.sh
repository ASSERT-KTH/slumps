#!/bin/bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

echo "Cloning SWAM"
if [ ! -d fuzzing-server-swam ]; then
    git clone --single-branch --branch master https://github.com/KTH/swam.git fuzzing-server-swam
fi

echo "Building SWAM"
cd fuzzing-server-swam
git pull
./millw cli.assembly
cd ..

$CURRENT_DIR/fuzzing-client-afl/build_afl.sh
$CURRENT_DIR/fuzzing-client-afl/build_interface.sh

echo "DONE!"
