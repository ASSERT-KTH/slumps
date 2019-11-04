# pipeline

### Workflow

1. __`.wast`__ →  __`.wasm`__ (by `wat2wasm` from [`wabt`](https://github.com/WebAssembly/wabt))

`wat2wasm xxx.wat -o xxx.wasm`

2. __`.wasm`__ →  __`.ll`__ (?) / __`.wasm`__ →  __`.c`__ (?) / __`.wasm`__ →  __`.rs`__ (?)

``

3. __`.c`__ → __`.ll`__ (based on `clang` from [`clang`]())

`clang -S -emit-llvm xxx.c -o xxx.ll`

3. __`.rs`__ → __`.ll`__ (based on `rustc` from [`rustc`]())

`rustc -S --emit=llvm-ir xxx.rs -o xxx.ll`

4. __`.ll`__ → __`.bc`__ (by `llvm-as` from [`llvm`](https://llvm.org/docs/index.html))

`llvm-as xxx.ll`

5. __`.bc`__ → __`.candopt`__ (based on `build/souper` from [`souper`](https://github.com/google/souper))

`souper -z3-path=/usr/bin/z3 xxx.bc > xxx.candopt`

6. __`.candopt`__ →  __`.lhsopt`__ (based on `build/souper-check` from [`souper`](https://github.com/google/souper))

`souper-check -z3-path=/usr/bin/z3 -print-replacement-split xxx.candopt > xxx.lhsopt`

7. __`.lhsopt`__ → __`.rhsopt`__ (based on `build/souper-check` from [`souper`](https://github.com/google/souper))

`souper-check -z3-path=/usr/bin/z3 -infer-rhs -souper-infer-iN xxx.lhsopt > xxx.rhsopt`

8. __`.rhsopt`__ → __`.ll`__ (based on `build/souper2llvm` from [`souper`](https://github.com/google/souper))

`souper2llvm xxx.rhsopt > xxx.ll`

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
bash pipeline.sh z/check.lhsopt
bash pipeline.sh z/infer.bc
bash pipeline.sh z/tmp.rhsopt
bash pipeline.sh z/paper.c
```

### Build

__dependency__

For Ubuntu 18.04, we use `apt` to install dependencies:
```
apt install git subversion cmake gcc g++ clang llvm-8 re2c z3
```

__slumps__

```
git clone https://github.com/KTH/slumps.git
cd slumps
git submodule update --init
```

__souper__

**Dependencies**
 - subversion (svn)
 - re2c
 - make
 - doxygen
 - dot (optional)

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

### Requirements

LLVM >= 8.0

