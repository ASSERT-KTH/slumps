# pipeline

### Workflow

1. __`.wast`__ →  __`.wasm`__ (by `wat2wasm` from [`wabt`](https://github.com/WebAssembly/wabt))

`wat2wasm xxx.wat -o xxx.wasm`

2. __`.wasm`__ →  __`.opt`__ (by `wasm-opt` from [`binaryen`](https://github.com/WebAssembly/binaryen))

`wasm-opt --flatten --souperify xxx.wasm`

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

__dependency__

For macOS 10.14, we use [`homebrew`](https://brew.sh/) to install dependencies:
```
brew install cmake gcc llvm re2c z3
```

For Ubuntu 18.04, we use `apt` to install dependencies:
```
apt install python git subversion cmake gcc g++ clang llvm-8 re2c z3
```

__slumps__

```
git clone https://github.com/KTH/slumps.git
cd slumps
git submodule update --init
```

__souper__

```
cd souper
./build_deps.sh
mkdir build && cd build
cmake ..
make
cd ../..
```

__wabt__

```
cd wabt
git submodule update --init
mkdir build && cd build
cmake ..
cmake --build .
cd ../..
```

__binaryen__

```
cd binaryen
cmake . && make
cd ..
```

### Requirements

Python2 >= 2.7

Python3 >= 3.6

LLVM >= 8.0

### Note
current solution for __`.opt`__ → __`.ll`__ is not so reliable
