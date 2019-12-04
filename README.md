# slumps
Research on randomization and superoptimization for WebAssembly WASM 

# C to superoptimized WASM

## Docker images

The pipeline to generate superoptimized WASM binaries is delivered in two docker images:
- The parent image, it contains the plumping to work with souper (our modest changed version), binaryen and wabt.
- The child image containing the bash script that performs the compound of the WASM binaries using the souper pass.

### To build docker images
- ```docker build -t slumps:backend -m 8g -f Dockerfile.back .```
- ```docker build -t slumps:latest -m 8g -f Dockerfile .```



### Execute slumps C pipeline using the docker image:

- Go to folder that contains the code files to superoptimize
- ```docker run --rm -v $(pwd):/input slumps:latest ```

### Develop mode

- Go to python folder in the repo 
- ```docker run --rm -it -v $(pwd):/slumps/python -v <absolute_path>/benchmark4pipeline_c:/input --entrypoint /bin/bash slumps:latest```

### Troubleshooting
- LLVM build takes to long or fails due to memory lack in the image building:
    >  Increase memory and/or CPU ressources in the docker engine configuration

- Right now, both images take approx. 8Gb of size in disk


## Study of memory disclosure vulnerabilities

[Slides](https://jacarte.github.io/wasm_presentation/)
