# AFL Plugin for SWAM

## Disclaimer

This is still in a prototyping stage. There are still many assumptions made on how AFL (and C++ and Scala and shared memory) works.

## Introduction

This plugin aims to act as an interface between SWAM and AFLplusplus. Since AFL is built to fuzz C++ programs, but nonetheless provides a generic algorithm, which is not only bound to this language, we aim to provide a spin-off that applies AFL to WASM binaries.

The interface.cpp file fakes the behaviour of the instrumented binary and instead forwards the fuzzed inputs given by AFL to the SWAM engine, which in turn forwards it to the WASM binary.

Therefore, instead of using the C++-compiler provided by AFLplusplus (afl-clang-fast++), we use the "standard" g++ compiler and instead mimic the instrumentation behaviour in the interface.

AFL communicates with the target binary with a shared memory by default. Since Scala does not seem suitable for such low-level operations, we have instead created a low-level wrapper for SWAM, interface.cpp. Whilst the code coverage plugin for SWAM writes it's results to a fixed file, our interface wrapper reads from this file and then feeds the content into the shared memory used by AFL.

## Test socket connection + SWAM with sample input (for fibo.wat)

1. Start the SWAM socket server

    ```bash
    mill -i cli.run run_server --wat --argType Int64 --main naive --out ./ <path_to_repo>/examples/docs/fibo.wat
    ```

1. Start socket client and communicate input/output with server

    ```bash
    ./run_test.sh
    ```

## Run AFL on example ./examples/docs/fibo.wat

**Disclaimer - this does not work yet, since the hosts & ports are not adjusted yet! Will be done in a later implementation using docker-compose.**

1. Start the SWAM Socket Server

    ```bash
    mill -i cli.run run_server --wat --argType Int64 --main naive --out ./ <path_to_repo>/examples/docs/fibo.wat
    ```

1. Run AFL with Docker

    ```bash
    docker pull aflplusplus/aflplusplus
    docker run
        --volume <path_to_repo>/fuzzer:/src aflplusplus/aflplusplus
        --entrypoint="/src/entrypoint_afl.sh"
        -e "WASM_ARG_TYPES_LIST=Int64"
        -e "WASM_ARG_LIST=15"
    ```

1. View ./interface.log for logs and ./out/ for AFL output

## Credits

- Initial idea and implementation (for Java): [Kelinci](https://github.com/isstac/kelinci)
