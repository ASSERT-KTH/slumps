# slumps
Research on randomization and superoptimization for WebAssembly WASM 

# C to superoptimized WASM

## Docker images

The pipeline to generate superoptimized WASM binaries is delivered in two docker images:
- The parent image, it contains the plumping to work with souper (our little change version), binaryen and wabt
- The child image containing the python script that performs the compound of the WASM binaries using the optimizations condidates found by souper

### To build docker images
- ```Docker build -t slumps:latest -m 8g -f Dockerfile .```
- ```Docker build -t slumps:script -m 8g -f Dockerfile.front .```



### Execute slumps C pipeline using the docker image:

- ```docker run --rm -v $(pwd):/input slumps:script to_optimize.c```

### Troubleshooting
- LLVM build takes to long or fails due to memory lack in the image building:
    >  Increase memory and/or CPU settings in the docker engine configuration


## Study of memory disclosure vulnerabilities

[Slides](https://jacarte.github.io/wasm_presentation/)
