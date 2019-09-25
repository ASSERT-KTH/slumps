echo "py ... \c"
python3 souper2llvm.py demo/infer.opt
echo "okay"

echo "llc ... \c"
llc -mtriple=wasm32-unknown-unknown -O3 -filetype=obj demo/infer.ll -o demo/infer.o
# test this command
# llc -march=wasm32 -filetype=obj demo/infer.ll
echo "okay"
