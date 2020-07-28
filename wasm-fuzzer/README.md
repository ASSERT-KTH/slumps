# AFL Plugin for SWAM

## Disclaimer

This is still in a prototyping stage. There are still many assumptions made on how AFL (and C++ and Scala and shared memory) works. Also, the coverage tool on which this plugin depends is currently still being developed.

## Introduction

This plugin aims to act as an interface between SWAM and [AFLplusplus](https://github.com/AFLplusplus/AFLplusplus). Since AFL is built to fuzz C++ programs, but nonetheless provides a generic algorithm, which is not only bound to this language, we aim to provide a spin-off that applies AFL to WASM binaries.

In the standard AFL setup, C++ source code is compiled using the C++ compiler provided by AFLplusplus (afl-clang-fast++), which "instruments" the code to do additional operations during run-time. The instrumentation that AFL's compiler usually injects into the target source code includes accessing a shared memory, which serves as a communication channel between AFL and the resulting binary. This channel is used to report the coverage data of each execution to AFL, so that AFL can make smarter decisions on the upcoming input parameters.

In our case, we are given a WASM binary and an interpreter built with Scala - in other words, no code that we can instrument with afl-clang-fast++. The workaround we provide to deal with this problem, is that we have built an interface (interface.cpp), which fakes the behaviour of the instrumented binary and instead forwards the fuzzed inputs given by AFL to the SWAM engine via a socket. The SWAM engine then in turn forwards it to the instantiated WASM function. By hard-coding the instrumentation into the interface, we can use the "standard" g++ compiler to compile it.

In SWAM, code coverage is handled in the package 'optin'. The socket server for SWAM on the other hand, is found in the package 'cli' and is executed with `mill cli.runserver <args>`. The cli makes use of the 'optin' package and returns the coverage results including an exit code of the WASM file through the socket. Interface.cpp then parses this data and feeds the content into the shared memory used by AFL. Even though AFL provides modes to work without using coverage data from executions it has triggered (see qemo mode), it is more efficient when provided it.

## Parsing AFL's fuzzed inputs

One major difference between C++ and WASM is that WASM only works with Int32/int, Int64/long, Float32/float and Float64/double. This matters, since AFL most commonly takes a config file as an input parameter, which is then first parsed from chars/strings to the corresponding type by the C++ code. Since a WASM function cannot simply receive a char or string and parse it to the int/long/float/double it needs, we need to do this manually beforehand.

To do this, we explicitly specify what argument types are required by the WASM function in the ./env file and also pass corresponding initial test parameters that work (also in the ./env file). We can then use the prepare_wasm_input.cpp file to write these initial input parameters into an input file with the correct bit representation. By reading this file at the beginning of the execution, the interface is also aware of how many bytes are exactly required by the WASM function, which helps when sending the correct data size towards the server socket or printing output. Furthermore, since the way AFL finds errors in the code is by flipping "random" bits in the config file, these bits need to be preserved without any changes when they are forwarded to SWAM through the socket.

Since the argument types for the WASM function are written as environmental variables, we can also parse them before initialising the SWAM socket server. The server then also knows exactly how to interpret the incoming bytes and how to feed them to the instantiated WASM function.

## Requirements

To be able to run this on your machine, only Docker is required. If you want to test SWAM's socket server without AFL, see the main page of this repository on how to set up SWAM.

## Building with docker-compose

This tool creates two Docker containers, as specified in the docker-compose.fuzzing.yml file - one for the SWAM socket server (Dockerfile in the root of this repository) and one for the AFL socket client (Dockerfile in this directory). The only configuration parameters to building this are currently the SCALA_VERSION and the MILL_VERSION in SWAM's Dockerfile. Nonetheless, it should not be required to change these parameters as they are fitted to the code of this repostory.

How to build:

```bash
docker-compose -f docker-compose.base.yml -f docker-compose.yml build
```

### Mechanics of SWAM's Dockerfile

We are not using the standard base image for the Scala Mill Build Tool [(nightscape/scala-mill)](https://hub.docker.com/r/nightscape/scala-mill/dockerfile), since it uses an older version of Scala and Mill. Our Dockerfile is however strongly based on theirs.

Mill currently does not provide any command to [simply install dependencies without compiling the source code](https://stackoverflow.com/questions/62834693/mill-build-tool-install-dependencies-without-compiling-source-code). Compiling the source code is done with `mill <package_name>.compile` and the reason why this is not included in the Dockerfile is to avoid the overhead of downloading all the same dependencies everytime source code is altered. The current workaround is to store the compiled sources along with the dependencies in volumes, which can be accessed during runtime and are specified in the docker-compose.fuzzing.yml file ("compiled_sources" & "maven_data"). SWAM's compilation is therefore delayed to the entrypoint (./entrypoint_mill_server.sh) and is encompassed in the `mill -i cli.run run_server <args>` command.

### Mechanics of AFL's Dockerfile

This image uses the [official image of AFLplusplus](https://hub.docker.com/r/aflplusplus/aflplusplus/) as a base, which contains the full configuration of AFL pre-installed. It then builds the C++ files of this folder with the standard Ubuntu g++ compiler (not the one provided by AFL). The C++ files are therefore not instrumented. The resulting executables are later accessed during run-time.

## Running with docker-compose

1. Configure ./.env file. This is where you specify which .wasm/.wat file & function you want to fuzzing and of what types it's input parameters are. Furthermore, it requires to provide a set of working input parameters, which are used in AFL test-runs and can be regarded as AFL's "seed" to random input. *WARNING: Do not rename this file or reference a different \*.env file in docker-compose.fuzzing.yml!*

2. Execute docker-compose configuration

    ```bash
    docker-compose -f docker-compose.base.yml -f docker-compose.yml up
    ```

3. View AFL's results and own logs in the folders which were specified in the .env file.

## Building & running without Docker

If you wish to run this plugin without using Docker, you will be required to install [AFLplusplus](https://github.com/AFLplusplus/AFLplusplus) and build SWAM with mill (see README of the root of this repository). Concerning AFLplusplus, running `make source-only` on the cloned repository along with installing the dependencies should suffice.

All other setup steps are best documented in the Dockerfile in the root of this repository, the Dockerfile in this folder and in entrypoint_afl.sh + entrypoint_mill_server.sh.

## Test SWAM's socket server with sample input (for fibo.wat)

1. Start the SWAM socket server. We want to run the "naive" function in the fibo.wat file. Since the function takes one long/Int64 as an input parameter, we need to specify this with the "--argType" option.

    ```bash
    mill -i cli.run run_server --wat --argType Int64 --main naive --out ./ <path_to_repo>/examples/docs/fibo.wat
    ```

1. Start socket client and communicate input/output with server

    ```bash
    ./run_test.sh
    ```

## Optimisations

### Done

1. **#SPEED**: SWAM is continuously running. It is not required to re-boot the JVM for every socket message it receives.

1. **#SPEED**: The SWAM socket server only instantiates the given WASM file/function once. Executing the instantiated function when receiving a message through the socket is equivalent to executing a fixed Scala function in the source code.

1. **#PORTABILITY**: Both the SWAM engine and AFLplusplus are dockerized in two separate containers and are given a corresponding docker-compose.fuzzing.yml setup. All required configuration is to be found in fuzzing/.env.

### To Do

1. **#SPEED**: Currently, the socket server is working synchronously and is incapable of handling multiple requests at the same time. There is also no setup built yet for multiple AFL instances to share the same output and work concurrently either.

## Example logs for fibo.wat with docker-compose configuration

The following the Docker logs of the SWAM server

1. receiving and parsing a message

2. calculating the instantiated WASM function (clever fibonacci) with the received inputs

3. gathering the coverage of the execution (currently still entirely random)

4. sending back the coverage along with the exit code

|          Fibonacci working           | Fibonacci failing (number too high)  |
| :----------------------------------: | :----------------------------------: |
| ![pass](./docs/fibo_log_working.png) | ![pass](./docs/fibo_log_failing.png) |

In the case of running fibo.wat, a lot of crashes are registered by AFL, since essentially any "high" number causes the call stack to exhaust, which is not accounted for by the function in fibo.wat.

## Credits

- Initial idea and implementation (for Java): [Kelinci](https://github.com/isstac/kelinci)
