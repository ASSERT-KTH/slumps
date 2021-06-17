# Superoptimizer for WebAssembly


## Intro to superoptimization

Given a C program compiled to Wasm, SLUMPs superoptimizer generates a new Wasm program which is smaller in size, and potentially faster, as we show in the image below.

![pass](docs/pass.png)

See paper [Superoptimization of WebAssembly Bytecode](http://arxiv.org/pdf/2002.10213) ([doi:10.1145/3397537.3397567](https://doi.org/10.1145/3397537.3397567))

### Execute
```bash
superopt.sh <program.c> 4 #Enumerative synthesis
```

To use a docker container

```bash
docker run -it --rm --entrypoint=/bin/bash -v $(pwd):/inputs slumps/superoptimizer:latest #CEGIS

# inside the docker container
bash pipeline.sh /inputs/<input_file.c> 4 #enumerative synthesis
```

### Build

__dependency__

For Ubuntu 18.04, we use `apt` to install dependencies:
```
apt install git subversion cmake gcc-multilib g++-multilib clang llvm-8 re2c z3
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

- Python >= 3.6
- LLVM >= 8.0
- Build souper
- export ROOT variable with the absolute path to slumps project. For example ```export ROOT=/Users/javierca/Documents/Develop/slumps```
