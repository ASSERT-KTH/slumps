#!/bin/sh

name=$(echo $1 | sed 's/\.[^.]*$//')
# ext=$(echo $1 | sed 's/^.*\.//')

echo "### step1 wat2wasm \c"
# wat2wasm ${name}.wat -o ${name}.wasm
echo "okay"

echo "### step2 wasm2opt \c"
# wasm-opt --flatten --simplify-locals-nonesting --souperify ${name}.wasm
echo "okay"

echo "### step3 opt2ll \c"
python3 souper2llvm.py ${name}.opt
# ../../souper/build/souper2llvm ${name}.opt > ${name}.ll # it seems not so good
echo "okay"

echo "### step4 ll2bc \c"
llvm-as ${name}.ll
echo "okay"

echo "### step5 bc2opt2ll \c"
sh bc2opt2ll.sh ${name}.bc ../../souper/build/souper
echo "okay"

echo "### extra ll2s \c"
llc -march=wasm32 -filetype=asm ${name}.ll
echo "okay"

echo "### extra ll2o \c"
llc -march=wasm32 -filetype=obj ${name}.ll
echo "okay"
