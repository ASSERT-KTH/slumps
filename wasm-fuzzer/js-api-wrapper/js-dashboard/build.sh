#!/bin/bash

build() {
    echo 'building react'

    rm -rf dist/*

    export INLINE_RUNTIME_CHUNK=false
    export GENERATE_SOURCEMAP=false

    node scripts/build.js

    mkdir -p dist
    cp -r build/* ../static

}

build