# ![Logo](https://en.gravatar.com/userimage/133494879/d7a324075159773e826a7eb397da07d7.png?size=80) CROW 

Research project on randomization for WebAssembly/WASM.

## General architecture

![Schema](docs/schema.png)

TODO

## Repo structure

TODO

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

- Install the python requirements: `pip3 install -r  crow/requirements.txt`

- RabbitMQ broker: `docker run -d --hostname my-rabbit --name some-rabbit --restart always -p 5672:5672 -p 8080:15672 rabbitmq:3-management
`

## Troubleshooting

- **CROW shows a fail in the CLANG step**: Install emscripten and run it as follows `emcc -v <file>.c`. Then copy all the include files in the [include](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L17) configuration for CROW.
- **CROW shows a fail connecting to REDIS**: Install Redis in your local pc and ensure that its running, or change the usage of external cache in the Souper [config](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L58).
- **CROW doesn't find the souper folder**: Check the [path](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L2) in the settings file
- **CROW Services dont start**: Check if the rabbitmq broker is active. Check the host and port of the broker in the settings are right, `... %event.host <ip>  %event.port <port>`


## How to use it

- Start the system: `bash crow/launch_system_standalone.sh <options>`
- Call the corresponding entrypoint, depending of the type of the file you want to process. For example,
`python3 crow/entrypoints/fromc.py program.c`

## Configuration \<options>

All the options to configure CROW are available in the [config.ini](crow/settings/config.ini) file. In the following, we mention what we think are the most important ones.


**Replacement exploration config**

**Replacement exploration config**

**Event broker config**

### Docker images

To run CROW in an easy way, we provide a Docker image which contains the plumping to work with Souper (our modest changed version), binaryen and wabt.
To build it, run: `docker build -t slumps/backend:latest -m 8g -f Dockerfile` inside the docker_images folder. 

If the LLVM build takes to long or fails due to memory lack in the image building:
    >  Increase memory and/or CPU ressources in the docker engine configuration

### CROW dockerized app

- `docker run -it --rm  slumps/crow2 <options>`: Launch all CROW services as a standalone docker container

Where to collect results...


#### Horizontal scalation

- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_generators.sh  <number of workers> <options>`: Launch only the generator services
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_entrypoints.sh <workers1> <workers2> <workers3> <options>`: Launch only the entrypoints service
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_exploration.sh  <options>`: Launch only the exploration service
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_logger.sh  <options>`: Launch only the logger service
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_monitor.sh <options>`: Launch only the monitor service
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_storage.sh  <options>`: Launch only the storage service
    - In the case of the storage service, you can mount a volume in the local machine to collect the generation, `-v $(pwd)/out:/slumps/crow/crow/storage/out`

#### Set REDIS cache for storage

`docker run --name some-redis -p 1010:9090 --restart always -d redis redis-server --port 9090`

Set password for redis server
`docker run -it  --rm redis redis-cli -h 192.168.10.126 -p 1010`

```
CONFIG SET requirepass "<pass>"
```


#### Examples

##### Standalone CROW

TODO

##### Horizontal scalation

TODO