# ![Logo](https://en.gravatar.com/userimage/133494879/d7a324075159773e826a7eb397da07d7.png?size=80) CROW 

Research project on randomization for WebAssembly/WASM.

## Prerequisites

- Python version 3.7

- Download our changed version of Souper. The main reason behind is that we include some extra options to be able of working together with the SLUMPs core. After downloading all the submodules in SLUMPs, build every one of them following the respective instructions in the original repos.

    Inside the `souper` folder:

    ```bash
    ./build_deps.sh
    mkdir build
    cd build
    cmake  ../
    make
    ```

- Build wabt toolkit to provide the WASM to WAT conversion for debugging reasons.

    Follow this instructions inside the `wabt` folder:

    ```bash
    git submodule update --init
    mkdir build
    cd build
    cmake ..
    cmake --build .
    ```

- Install the python requirements: `pip3 install -r src/requirements.txt`

## Troubleshooting

- **CROW shows a fail in the CLANG step**: Install emscripten and run it as follows `emcc -v <file>.c`. Then copy all the include files in the [include](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L17) configuration for CROW.
- **CROW shows a fail connecting to REDIS**: Install Redis in your local pc and ensure that its running, or change the usage of external cache in the Souper [config](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L58).
- **CROW doesn't find the souper folder**: Check the [path](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L2) in the settings file
- **CROW fails in the souper opt pass**: Check the [name](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L48) for the souper pass (for instance, the extension for Ubuntu can be different to the Mac one).

## Config options

- **Optimization subset strategy**: [generator-method](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L9) = subset | onexone | all

- **Output only different binaries**: [prune-equal](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L6), we calculate the sha256 value for evey WASM program, then we keep only the programs with different sha values.

Change the remaining values to get different results, for instance, add extra arguments to the CLANG step.

## How to use it

Run `python3  crow/crow/crow.py <file.c>` or run it directly on LLVM IR (the 'wasm32-unknown-unknown' target needs to be used during compilation) `python3 crow/crow/crow.py <file.bc>`

### Docker images

To run CROW in an easy way, we provide a Docker image which contains the plumping to work with Souper (our modest changed version), binaryen and wabt.
To build it, run: `docker build -t slumps:backend -m 8g -f Dockerfile` inside the docker_images folder. 

If the LLVM build takes to long or fails due to memory lack in the image building:
    >  Increase memory and/or CPU ressources in the docker engine configuration

### CROW dockerized app

Bothg images are avaiable in the docker [Hub](https://hub.docker.com/repository/docker/jacarte/slumps)

The application can be ported to a docker container too. To execute SLUMPs, enter in the src file and build the docker image. Run the following command to start the application ```docker run -it -v $(pwd)/<logs>:/slumps/src/logs -v $(pwd)/<out folder>:/slumps/src/out jacarte/slumps:app <url to download the program code> <config-options> ```. Slumps will process the fetched code from the arguments, exporting the results to the out folder volumen. You can specify the config parameters, specify the values of ```<config-options>``` as ```%<namespace>.key <value>```. For example, to change the timeout per program use ```<docker_run> %DEFAULT.timeout 3600 <program_url>```, this example changes the timeout to 3600 seconds. The other available options and possible values are listed below.


|Namespace|Key|Default value|Comments|
|--|--|--|--|
DEFAULT | slumpspath | /slumps | |
| | debugfile | /slumps/src/slumps.debug.txt | |
| | outfolder | /slumps/src/out | |
| | print-sha | True | |
| | prune-equal | True | |
| | exit-on-find | False | |
| | generator-method | subset | ```all``` to superoptimize :) |
| | candidates-threshold | 1 | |
| | fail-silently | True | |
| | timeout | 3600 | |
| | link-wasi | False | Add WASI std lib to create WASM binaries |
clang | command | -S -O3 --target=wasm32-unknown-unknown -emit-llvm  | You can add extra includes |
wasm-ld | command | --no-entry --export-all --allow-undefined -o %s | |
wabt | path | /slumps/wabt/bin | |
| | wasm2wat | /slumps/wabt/bin/wasm2wat | |
souper | solver | -z3-path=/slumps/souper/third_party/z3/build/z3 | |
| | passname | libsouperPass.so | |
| | souper-debug-level | 2 | |
| | souper-common | -solver-timeout=1800 | |

## Study of memory disclosure vulnerabilities

[Slides](https://jacarte.github.io/wasm_presentation/)

## Souper new features

We added some features/options to Souper:

- **`souper-subset`**: Based on the candidate indexes, specify the candidates to be applied, for example
`-souper-subset=1,2,3,4` or `-souper-subset=0,3`
- **`souper-valid-count`**: Search for successful optimizations without replacing
- **`souper-redis-host`**: Host for redis
- **`souper-redis-pass`**: Password for redis connection


## Issues

- Candidates overlapping. For example, in the `bitwise_IO` problem there are only 36 different programs:
    `Total number of programs 2048. Different sha count 36`

- LLVM frontend for WASM: This will provide the WASM -> WASM behavior in SLUMPs
