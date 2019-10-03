clang --target=wasm32-unknown-wasi --sysroot /Users/javier/Documents/Develop/wasi_build \
  -O3 -s -o main.wasm main.c