#!/bin/sh

echo "py ... \c"
python3 souper2llvm.py demo/infer.opt
echo "okay"

echo "llc ... \c"
llc -march=wasm32 -filetype=obj demo/infer.ll
echo "okay"
