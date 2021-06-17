# WAFL - Fuzz your Wasm with AFLplusplus

## Introduction

This tool aims to act as an interface between [SWAM](https://github.com/satabin/swam) and [AFLplusplus](https://github.com/AFLplusplus/AFLplusplus). Whilst SWAM is a Scala interpreter for WebAssembly, AFL is a fuzzing tool for C++ programs. Since AFL provides a generic fuzzing algorithm which is not necessarily bound to C++, we aim to provide a spin-off that applies it to Wasm binaries.

In the standard AFL setup, C++ source code is compiled using the C++ compiler provided by AFLplusplus (afl-clang-fast++), which "instruments" the code to do additional operations during run-time. The instrumentation that AFL's compiler usually injects into the target source code includes accessing a shared memory, which serves as a communication channel between AFL and the resulting binary. This channel is used to report the coverage data of each execution to AFL, so that AFL can make smarter decisions on the upcoming input parameters.

In our case, we are given a Wasm binary and an interpreter built with Scala - in other words, no code that we can instrument with afl-clang-fast++. The workaround we provide to deal with this problem, is that we have built an interface (interface.cpp), which fakes the behaviour of the instrumented binary and instead forwards the fuzzed inputs given by AFL to the SWAM engine via a socket. The SWAM engine then in turn forwards it to the instantiated Wasm function. By hard-coding the instrumentation into the interface, we can use the "standard" g++ compiler to compile it.

In SWAM, code coverage is handled in the package 'optin'. The socket server for SWAM on the other hand, is found in the package 'cli_server' and is executed with `mill cli_server.run run_server <args>`. The cli makes use of the 'optin' package and returns the coverage results including an exit code of the Wasm file through the socket. Interface.cpp then parses this data and feeds the content into the shared memory used by AFL. Even though AFL provides modes to work without using coverage data from executions it has triggered (see qemo mode), it is more efficient when provided it.

Right now, we support fuzzing of four data types as function parameter:

* int32
* int64
* float32
* float64

Reference documentation in (see part 1, Coverage Measurements): https://github.com/google/AFL/blob/master/docs/technical_details.txt

Right now, we support fuzzing of four data types as function parameter:

* int32
* int64
* float32
* float64

Reference documentation in (see part 1, Coverage Measurements): https://github.com/google/AFL/blob/master/docs/technical_details.txt

## Parsing AFL's fuzzed inputs

One major difference between C++ and Wasm is that Wasm only works with Int32/int, Int64/long, Float32/float and Float64/double. This matters, since AFL most commonly takes a config file as an input parameter, which is then first parsed from chars/strings to the corresponding type by the C++ code. Since a Wasm function cannot simply receive a char or string and parse it to the int/long/float/double it needs, we need to do this manually beforehand.

To do this, we explicitly specify what argument types are required by the Wasm function in the ./env file and also pass corresponding initial test parameters that work (also in the ./env file). We can then use the ./fuzzing-client-afl/prepare_wasm_input.cpp file to write these initial input parameters into an input file with the correct bit representation. By reading this file at the beginning of the execution, the interface is also aware of how many bytes are exactly required by the Wasm function, which helps when sending the correct data size towards the server socket or printing output. Furthermore, since the way AFL finds errors in the code is by flipping "random" bits in the config file, these bits need to be preserved without any changes when they are forwarded to SWAM through the socket.

Since the argument types for the Wasm function are written as environmental variables, we can also parse them before initialising the SWAM socket server. The server then also knows exactly how to interpret the incoming bytes and how to feed them to the instantiated Wasm function.

## Requirements

To be able to run this on your machine, only Docker is required. If you want to test SWAM's socket server without AFL, see ./fuzzing-server-swam on how to install SWAM.

## Configuration

All configuration options are visible in the .env file. This is where you specify which .wasm/.wat file & function you want to be fuzzing and of what types it's input parameters are. Furthermore, it requires to provide a set of working input parameters, which are used in AFL test-runs and can be regarded as AFL's "seed" to random input.

## Build & Run with Docker

The are no configuration parameters in the Dockerfile. The JVM is installed manually in this Dockerfile. It's entrypoint also only references the entrypoints of the client and the server.

### AFL section in Dockerfile

This image uses the [official image of AFLplusplus](https://hub.docker.com/r/aflplusplus/aflplusplus/) as a base, which contains the full configuration of AFL pre-installed. It then builds the C++ files of this folder with the standard Ubuntu g++ compiler (not the one provided by AFL). The C++ files are therefore not instrumented. The resulting executables are later accessed during run-time.

### SWAM section in Dockerfile

Mill currently does not provide any command to [simply install dependencies without compiling the source code](https://stackoverflow.com/questions/62834693/mill-build-tool-install-dependencies-without-compiling-source-code). Compiling the source code is done with `mill <package_name>.compile` and the reason why this is not included in the Dockerfile is to avoid the overhead of downloading all the same dependencies everytime source code is altered. The current workaround is to download pre-built .jar artifacts from the SWAM repository. Whenever the SWAM code is changed, these artifacts need to be re-published.

### Build with Docker

```bash
docker build -t wafl .
```

### Running

1. Configure the ./.env file. See [Configuration](#Configuration) for details.

2. Source the ./.env file.

    ```bash
    set -a
    source ./.env
    set +a
    ```

3. Run the Docker image.

    ```bash
    docker run --env-file=./.env \
        -v maven_data:/root/.cache/coursier/v1/https/repo1.maven.org/maven2 \
        -v compiled_sources:/home/server/src/out/ \
        -v ${LOCAL_WASM_DIR:?err}:/home/server/wasm/ \
        -v ${PWD}/wafl-temp/afl-out:/home/client/out/ \
        -v ${PWD}/wafl-temp/logs:/home/shared/logs/ \
        wafl:latest \
        <.wasm/.wat filename> <target function> <seed arguments csv>
    ```

### Multi-processing

AFLplusplus is encouraged to be run with multiple instances if multiple cores are available. More information is available [here](https://github.com/mirrorer/afl/blob/master/docs/parallel_fuzzing.txt). To automatically run multiple instances in their master/secondary configuration, you can run the the script `./multi-processing.sh`. The steps of building the image and configuring the .env file are identical to running only one instance.

```bash
# 3 for the number of AFL instances.
./multi-processing.sh 3 <.wasm/.wat filename> <target function> <seed arguments csv>
```

## Building & Run without Docker

### Build

1. Install [AFLplusplus](https://github.com/AFLplusplus/AFLplusplus). Running `make source-only` on the cloned repository along with installing the dependencies should suffice. For the full build:

    ```bash
    ./fuzzing-client-afl/build_afl.sh
    ```

2. Build the WAFL interface:

    ```bash
    ./fuzzing-client-afl/build_interface.sh
    ```

3. Install SWAM:

    a) Download pre-built SWAM jar (preferred):

    ```bash
    curl -o swam_cli.jar -L https://github.com/KTH/swam/releases/download/v0.6.0-RC3/swam_cli.jar
    curl -o swam_server.jar -L https://github.com/KTH/swam/releases/download/v0.6.0-RC3/swam_server.jar
    ```

    b) Build with SWAM.cli & SWAM.cli_server with mill:

    ```bash
    cd ./fuzzing-server-swam
    ./millw cli.assembly
    ./millw cli_server.assembly
    ```

    This requires the definitions of SWAM_CLI_CMD and SWAM_SERVER_CMD in ./prepare_env.sh to be adjusted. Also, see ./fuzzing-server-swam/README.md for further details on how to build SWAM with mill.

### Run

1. Configure the ./.env file. See [Configuration](#Configuration) for details.

2. Source the ./.env file.

    ```bash
    set -a
    source ./.env
    set +a
    ```

3. Run:

    ```bash
    ./wafl.sh <.wasm/.wat filepath> <target function> <seed arguments csv>
    ```

## Test SWAM's socket server with sample input (for fibo.wat)

This just checks whether SWAM and the overall protocoll communicating with between the interface and SWAM is working. AFL is not required for this.

1. Start the SWAM socket server. We want to run the "naive" function in the fibo.wat file.

    a) Using the entrypoint (arguments: `<.wasm/.wat filepath> <target function> <seed arguments csv>`):

    ```bash
    `./entrypoint_mill_server.sh <path_to_repo>/examples/docs/fibo.wat naive 10`
    ```

    b) If SWAM was built with mill, you can run:

    ```bash
    mill cli_server.run run_server --wat --main naive <path_to_repo>/examples/docs/fibo.wat
    ```

2. Start socket client and communicate input/output with server (arguments: `<.wasm/.wat filepath> <target function> <seed arguments csv>`):

    ```bash
    ./test_socket.sh <path_to_repo>/examples/docs/fibo.wat naive 10
    ```

## Optimisations

### Done

1. **#SPEED**: SWAM is continuously running. It is not required to re-boot the JVM for every socket message it receives.

1. **#SPEED**: The SWAM socket server only instantiates the given Wasm file/function once. Executing the instantiated function when receiving a message through the socket is equivalent to executing a fixed Scala function in the source code.

1. **#PORTABILITY**: Both the SWAM engine and AFLplusplus are dockerized in a single container. All required configuration is to be found in ./.env.

1. **#SPEED**: It is possible to run multiple AFL instances in parallel in a Master/Secondary configuration. See section on [Multi-processing](#Multi-processing).

## Example logs for fibo.wat with docker-compose configuration (outdated)

The following the Docker logs of the SWAM server

1. receiving and parsing a message

2. calculating the instantiated Wasm function (clever fibonacci) with the received inputs

3. gathering the coverage of the execution (currently still entirely random)

4. sending back the coverage along with the exit code

|          Fibonacci working           | Fibonacci failing (number too high)  |
| :----------------------------------: | :----------------------------------: |
| ![pass](./docs/fibo_log_working.png) | ![pass](./docs/fibo_log_failing.png) |

In the case of running fibo.wat, a lot of crashes are registered by AFL, since essentially any "high" number causes the call stack to exhaust, which is not accounted for by the function in fibo.wat.

## Credits

- Initial idea and implementation (for Java): [Kelinci](https://github.com/isstac/kelinci)
