#!/bin/bash
set -e
set -x

# Original bitcodes directory
rm -rf /workdir/bitcodes /workdir/var /workdir/var/[0-9]* /workdir/libsodium[0-9]* /workdir/*.zip
mkdir /workdir/bitcodes

# Prepare default libsodium dir and bitcodes
cd /libsodium
MAKE_PROCS=40 CC=/cc_wrap.py dist-build/wasm32-wasi.sh && { CC=clang make CC=clang -j check &>/dev/null || true; }
find . -name '*.bc' -exec mv {} /workdir/bitcodes/ \;

cp -r /workdir/bitcodes /workdir/var
MAKE_PROCS=40 OPT_LEVEL=0 CC=/cc_bc_wrap.py dist-build/wasm32-wasi.sh && { CC=clang make CC=clang -j check &>/dev/null || true; }

cd /workdir
CC=/cc_bc_wrap.py OPT_LEVEL=0 python3 -u ./run_vars.py "$1" | grep -vE '^make' | grep -vE '^Making' | tee out.txt
