# pipeline

### Workflow

1. __`.wast`__ →  __`.wasm`__ (by `wat2wasm` from [`wabt`](https://github.com/WebAssembly/wabt))
`wat2wasm xxx.wat -o xxx.wasm`

2. __`.wasm`__ →  __`.opt`__ (by `wasm-opt` from [`binaryen`](https://github.com/WebAssembly/binaryen))
`wasm-opt --flatten --simplify-locals-nonesting --souperify xxx.wasm`

3. __`.opt`__ → __`.ll`__ (based on `utils/souper2llvm.in` from [`souper`](https://github.com/google/souper))

4. __`.ll`__ → __`.bc`__ (by `llvm-as` from [`llvm`](https://llvm.org/docs/index.html))
`llvm-as xxx.ll`

5. __`.bc`__ → __`.opt`__ (based on `souper` from [`souper`](https://github.com/google/souper)) → __`.ll`__ (same as step3)

----

if we need assembly filetype:
__`.ll`__ → __`.s`__ (by `llc` from [`llvm`](https://llvm.org/docs/index.html))
```
$ llc -march=wasm32 -filetype=asm xxx.ll
```
or we need binary filetype:
__`.ll`__ → __`.o`__ (by `llc` from [`llvm`](https://llvm.org/docs/index.html))
```
$ llc -march=wasm32 -filetype=obj xxx.ll
```

### Demo
```
sh pipeline.sh demo/2.wast
sh pipeline.sh demo/infer.opt
```

### Build

__souper__

manually install `re2c` `z3`

```
cd souper
./build_deps.sh
mkdir build
cd build
cmake ..
make
```

__wabt__

```
cd wabt
git submodule update --init
mkdir build
cd build
cmake ..
cmake --build .
```

__binaryen__

```
cmake . && make
```

### Requirements

Python >= 3.6
LLVM >= 8.0

### Note
1. current solution for __`.opt`__ → __`.ll`__ is not so reliable
2. for reference, my env is `llv=9.0.0`, `gcc=9.2.0`, `cmake=3.15.3`
