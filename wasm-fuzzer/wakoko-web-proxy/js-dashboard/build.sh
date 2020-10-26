#!/bin/bash

build() {
    echo 'building react'

    rm -rf build/*

    export INLINE_RUNTIME_CHUNK=false
    export GENERATE_SOURCEMAP=false

    node scripts/build.js

    mkdir -p dist
    cp -rf build/static/js/* ../static

    touch ../static/index.js
}

build