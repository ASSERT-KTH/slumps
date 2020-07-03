# AFL Plugin for SWAM

## Disclaimer

This is still in a prototyping stage. There are still many assumptions made on how AFL (and C++ and Scala and shared memory) works.

## Introduction

This plugin aims to act as an interface between SWAM and AFLplusplus. Since AFL is built to fuzz C++ programs, but nonetheless provides a generic algorithm, which is not only bound to this language, we aim to provide a spin-off that applies AFL to WASM binaries.

The interface.cpp file fakes the behaviour of the instrumented binary and instead forwards the fuzzed inputs given by AFL to the SWAM engine, which in turn forwards it to the WASM binary.

Therefore, instead of using the C++-compiler provided by AFLplusplus (afl-clang-fast++), we use the "standard" g++ compiler and instead mimic the instrumentation behaviour in the interface.

AFL communicates with the target binary with a shared memory by default. Since Scala does not seem suitable for such low-level operations, we have instead created a low-level wrapper for SWAM, interface.cpp. Whilst the code coverage plugin for SWAM writes it's results to a fixed file, our interface wrapper reads from this file and then feeds the content into the shared memory used by AFL.

## Run

1. Run AFL with Docker

    ```bash
    docker pull aflplusplus/aflplusplus
    docker run -ti -v <path_to_repo>/fuzzer:/src aflplusplus/aflplusplus
    ```

1. Compile

    ```bash
    cd /src
    g++ interface.cpp
    ```

1. Run AFL

    ```bash
    afl-fuzz -i /src/in -o out -m none -d -- /src/a.out @@
    ```

1. View /src/interface.log for custom logs and /src/out/ for AFL output

## Credits

- Initial idea and implementation (for Java): [Kelinci](https://github.com/isstac/kelinci)
