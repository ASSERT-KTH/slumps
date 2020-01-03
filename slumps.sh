
source ~/.bashrc

PS1="(SLUMPS) "

pwd=$(PWD)
shopt -s expand_aliases

export PATH=$pwd/souper/build:$PATH

alias clang='${pwd}/souper/third_party/llvm/Release/bin/clang'
alias llc='${pwd}/souper/third_party/llvm/Release/bin/llc'
alias llvm-as='${pwd}/souper/third_party/llvm/Release/bin/llvm-as'
alias llvm-opt='${pwd}/souper/third_party/llvm/Release/bin/opt'
alias souper='${pwd}/souper/build/souper'
alias souper-check='${pwd}/souper/build/souper-check'
alias wasm2c='${pwd}/wabt/bin/wasm2c'
alias wasm2wat='${pwd}/wabt/bin/wasm2wat'
alias wasm-ld='/usr/bin/wasm-ld-8'

# vars
z3=${pwd}'/souper/third_party/z3/build/z3'
libsouperPass=${pwd}'/souper/build/libsouperPass.dylib'

# 