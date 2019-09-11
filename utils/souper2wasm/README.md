# from Souper IR to WASM

__Souper IR → LLVM IR__
Souper's [souper-check.cpp](https://github.com/google/souper/blob/master/tools/souper-check.cpp) and [souper2llvm.in](https://github.com/google/souper/blob/master/utils/souper2llvm.in)

__LLVM IR → WASM__
`llc -mtriple=wasm32-unknown-unknown` ([blog](https://medium.com/@richardanaya/write-web-assembly-with-llvm-fbee788b2817))

## run demo
```
zsh run.sh
```

## requirements
Python >= 3.6
LLVM >= 8.0

## existing issues
- In some cases (like `demo/negate.opt`), width info can not be identified correctly
