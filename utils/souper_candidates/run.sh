# we use infer.ll as one example
echo "preparing \c"
llvm-as demo/infer.ll -o demo/infer.bc
echo "okay"

# $ /path/to/souper -z3-path=/usr/bin/z3 /path/to/file.bc
echo "souper ... \c"
./souper demo/infer.bc > demo/infer.candidates
echo "okay"

echo "py ... \c"
python3 split.py demo/infer.candidates
echo "okay"
