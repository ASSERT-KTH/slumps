#!/bin/bash


cd ../../../

git submodule init

git submodule update

if [ ! -d "souper/build/souper" ]; then
  cd souper
  if [ ! -d "./third_party" ]; then
    ./build_deps.sh
  fi

  mkdir build
  cd build
  echo "Building..."
  cmake  ../
  make

  cd ../..
fi



cd binaryen
cmake . && make
cd ../utils/pipeline/python