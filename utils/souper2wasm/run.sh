python3 souper2llvm.py demo/infer.opt
llc -mtriple=wasm32-unknown-unknown -O3 -filetype=obj demo/infer.ll -o demo/infer.o