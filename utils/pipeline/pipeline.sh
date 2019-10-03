#!/bin/sh

name=$(echo $1 | sed 's/\.[^.]*$//')
ext=$(echo $1 | sed 's/^.*\.//')

# export BINARYEN_DEBUG_SOUPERIFY=0

if [ "${ext}" == "wast" ]; then
  echo "### step1 wast2wasm \c"
  ../../wabt/bin/wat2wasm ${name}.wast -o ${name}.wasm
  echo "okay"

  echo "### step2 wasm2opt \c"
  ../../binaryen/bin/wasm-opt ${name}.wasm --flatten --souperify-single-use > ${name}.opt
  echo "okay"
fi

if [ "${ext}" == "wasm" ]; then
  echo "### step2 wasm2opt \c"
  ../../binaryen/bin/wasm-opt ${name}.wasm --flatten --souperify-single-use > ${name}.opt
  echo "okay"
fi

echo "### step3 opt2ll \c"
python souper2llvm.py ${name}.opt > ${name}.ll
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
