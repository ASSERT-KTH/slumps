# ![Logo](https://en.gravatar.com/userimage/133494879/d7a324075159773e826a7eb397da07d7.png?size=80) CROW 


CROW is a superdiversitifer for WASM. The reference explanation is in paper [CROW: Code Diversification for WebAssembly](http://arxiv.org/pdf/2008.07185).

```bibtex
@inproceedings{crow,
 title = {CROW: Code Diversification for WebAssembly},
 author = {Javier Cabrera Arteaga and Orestis Floros Malivitsis and Oscar Luis Vera Pérez and Benoit Baudry and Martin Monperrus},
 booktitle = {Proceedings of MadWEB},
 year = {2021},
}
```

## General architecture

![Schema](docs/schema.png)

CROW is implemented as an event-based system. We presented a general flow overview in the figure above. The broad pipeline is as follows, we passed a C file, it is compiled, and a "Launch Souper exploration" message is sent to the superdiversifier. During the exploration phase, for each found replacement (and replacement combinations), a "Generate variant" message is sent to the generators. A generator builds the bitcode file using a found potential replacement and emits a "Bitcode to Wasm" message. For all generated files in the system, a "Store" message is sent to save the files, i.e., all bitcodes from the generators and all Wasm files.


Since the system is event-based, you can emit the messages at any stage of the system. For example, if you want to generate variants from a bitcode file instead of a C file, you can call the `bc2wasm.py <bitcode file>` script; it will read the bitcode file and will send it for exploration, and the system will execute the remaining variants generation flow.

## Repo structure

The repository is structured as follows:

- 4docker: Docker image entrypoints. Each entrypoint launches a specific type of worker, e.g., variant generators.
- crow
  - cache: Package for caching. It is used by the storage service to avoid the saving of duplicated files. Besides, the explorer checks if the replacement was already generated, avoiding duplicate generation. The package contains two implementations: memory-based with a native python dict implementation and another implementation using Redis. The Redis implementation allows the horizontal escalation of the CROW system.
  - commands: This package contains the commands using by CROW, like the clang compilation of a C file.
  - entrypoints: This package contains the main workers and event listeners.
  - events: Base implementation of the event-based engine.
  - monitor: Logging implementation plus a 'dash' dashboard for monitoring the variants generation process.
  - sanitizers: The sanitizers to remove duplicate code and 'idempotent' replacements in the output of the modified Souper. For example, during compilation to Wasm, two different sum operations are different under LLVM, being the same in Wasm, this is the case for 'addnsw' and 'add' LLVM instructions. We care about these cases, and we try to remove most of them.
  - settings: System configuration, like exploration timeout.
  - storage: Storage workers
- deploy: 
  - docker-compose.yaml: file to deploy the full service. 
  - kubernetize.sh: It uses [kompose](https://github.com/kubernetes/kompose) to transform the docker-compose.yml service intro a kubernetes deployment. It can be used to horizontally escalate CROW. Besides, there is a minio storage implementation to centralize the artifact (generated files) storage.
  
- docs: Images for documentation.
  
- setup.py: To allow installing using pip.


## Prerequisites

- Python version 3.7


- Download our changed version of Souper. The main reason behind is that we include some extra options to be able of working together with the CROWs core. After downloading all the submodules in SLUMPs, build every one of them following the respective instructions in the original repos.

    Inside the `souper` folder of the repo:

    ```bash
    ./build_deps.sh
    mkdir build
    cd build
    cmake  ../
    make
    ```

- Build wabt toolkit to provide the WASM to WAT conversion for debugging reasons.

    Follow these instructions inside the `wabt` folder:

    ```bash
    git submodule update --init
    mkdir build
    cd build
    cmake ..
    cmake --build .
    ```

- Install the python requirements: `pip3 install -r requirements.txt`

- RabbitMQ broker: `docker run -d -P --hostname rabbit -p 5009:5672 -p 5010:15672 --name rabbitmq -e RABBITMQ_DEFAULT_USER=user -e RABBITMQ_DEFAULT_PASS=pass rabbitmq:3.6.10-management`

- Redis: `docker run --name some-redis -p 1010:9090 --restart always -d redis redis-server --port 9090`

  Set password for redis server: `docker run -it  --rm redis redis-cli -h <host> -p 1010`

  ```
  CONFIG SET requirepass "<pass>"
  ```


## How to use it
- Set the corresponding credentials for the broker as env. variables, i.e. `export BROKER_PASS=...` and `export BROKER_USER=...`.
- Start the system: `bash crow/launch_system_standalone.sh <options>`. This script will call the corresponding python scripts to launch the workers. You can change the script content to increase/decrease the resources allocated and the number of workers in each stage of the system.
  
- Call the corresponding entrypoint, depending on the type of the file you want to process. For example,
`python3 -m crow.entrypoints.fromc program.c` to start a superdiversification of `program.c`

- Collect the results inside the crow/storage/out folder. An alternative way to collect the result is to access `localhost:8050` in your browser, you will see a dashboard in which you can download the generated bitcodes/wasms variants.


Since CROW is built on top of several tools and each of them needs a different setup process and an expensive in time building, we strongly recommend using a [docker](#images) deploy of the system. 


## Troubleshooting

- **CROW shows a fail in the CLANG step**: Install emscripten and run it as follows `emcc -v <file>.c`. Then copy all the include files in the [include](https://github.com/KTH/slumps/blob/18ef5189904e25019155fe305046f4b5b8907538/src/settings/config.ini#L17) configuration for CROW.
- **CROW shows a fail connecting to REDIS**: Install Redis in your local pc and ensure that its running, or change the usage of external cache in the Souper [config](crow/settings/config.ini).
- **CROW doesn't find the souper folder**: Check the [slumpspath](crow/settings/config.ini) in the settings file
- **CROW Services don't start**: Check if the rabbitmq broker is active. Check the host and port of the broker in the [settings](crow/settings/config.ini) are right, `... %event.host <ip>  %event.port <port>`



## Configuration \<options>

All the options to configure CROW are available in the [config.ini](crow/settings/config.ini) file. The configuration options can be set calling the [updatesettings.py](crow/update_settings.py) using the following format, `%<namespace>.<option> <value>`.  CROW has 11 configuration namespaces:
DEFAULT, event, cache, sanitizer, clang, log, opt, llvm-as, wasm-ld, wabt and souper.

In the following, we mention what we think are the most important namespaces and options.

**DEFAULT** : General system config

- %DEFAULT.link-wasi <True|False> : Add WASI to the Wasm compilation, False by default.
- %DEFAULT.exploration-timeout <int> : How much time will be used to find for potential replacements with Souper. 
- %DEFAULT.upper-bound <int>: For research purposes, you can limit the number of generated variants.
- %DEFAULT.workers <int>: We set 21 different levels of exploration, setting this options you can set how many of the levels are explored at the same time.
- %DEFAULT.order <int, +> (%DEFAULT.order 0,3,1,20): Set the levels to explore, it is a comma separeted list of integers from 0 to 21 (0 for default Souper options).
- %DEFAULT.generation-simple-timeout <int>: Sometimes the replacement generation can take a while, with this option you can set a timeout to the variant generation avoiding botlenecks.
- %DEFAULT.keep-ll-files <True|False>: To save (or not) the passed LL format files 
- %DEFAULT.keep-bc-files <True|False>: To save (or not) the passed LLVM bitcode files 
- %DEFAULT.keep-wasm-files <True|False>: To save (or not) the generated Wasm files
- %DEFAULT.log2file <True|False>: Set the logging service to save the traces to file or print them to the std
- %DEFAULT.debug-level <int>: To set how much information the logging system shows. 
- %DEFAULT.combinations <True|False>: To recombine more than one replacement in the variant generation. By default is switched off, notice that all combinations can lead to an exponential explosion of variants.

**Replacement exploration config (souper namespace)**
- %souper.workers <int>: We modified Souper to check and try to infer the replacements using more than one thread, to set the number of threads set this option. Notice that this process could be quite expensive, take care of this number.


**Event broker config (event namespace)**

- %event.host <host>: The address of the broker
- %event.port <int>: The broker service port

Notice that the password, and the user are passed through envirnment variables.

### <a id="images"></a>Docker images

CROW docker images stack contains three main images, **slumps/souper**, **slumps/backend** and **slumps/crow2**

- **slumps/souper**: This our modified Souper, to build this image run `docker built -t slumps/souper` inside the souper folder.


- **slumps/backend**: This image collect the needed tools to support crow, it needs the **slumps/souper** image and it includes wabt and the WASI headers. To build it, run `docker build -t slumps/backend` inside the docker_images folder.


- **slumps/crow2**: This is the harness for CROW, it needs the **slumps/backend** image. To build it, run `docker build -t slumps/crow2` inside the crow folder.


### CROW dockerized app

- `docker run -it --rm  slumps/crow2 <options>`: Launch all CROW services as a standalone docker container
    - You can mount a volume in the local machine to collect the generation, `-v $(pwd)/out:/slumps/crow/crow/storage/out`

- Inside the deploy folder you can find a docker-compose stack declaration with an example of the service deplyment


#### Horizontal escalation

- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_generators.sh  <number of workers> <options>`: Launch only the generator services
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_entrypoints.sh <workers1> <workers2> <workers3> <options>`: Launch only the entrypoints service
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_exploration.sh  <options>`: Launch only the exploration service
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_logger.sh  <options>`: Launch only the logger service
- `docker run -it --rm --entrypoint="/bin/bash" slumps/crow2:latest ./launch_storage.sh  <options>`: Launch only the storage service
    - In the case of the storage service, you can mount a volume in the local machine to collect the generation, `-v $(pwd)/out:/slumps/crow/crow/storage/out`
  
- `docker run -it --rm -e MINIO_ACCESS_KEY=<key> -e MINIO_SECRET_KEY=<secret> -e MINIO_HOST=<minio_host> --entrypoint="/bin/bash" slumps/crow2:latest ./launch_storage_minio.sh  <options>`: Launch the minio storage service

#### Example

```sh
# Launch the system
cd deploy
docker-compose up

# The service will launch 1 explorer (bc2wasm), 2 variantcreators, 1 bc2wasm convertor, 1 wasm2wat convertor, 1 ll2bc convertor and 1 storage manager.
```

```sh
# Start a task
export BROKER_PASS=<broker_pass>
export BROKER_USER=<broker_user>
# Start from a C program
python3 -m crow.entrypoints.fromc program.c
```

```sh
# Start a task
export BROKER_PASS=<broker_pass>
export BROKER_USER=<broker_user>
# Start from llvm bitcode
python3 -m crow.entrypoints.bc2wasm module.bc
```

```sh
# Launch the logs monitor
export BROKER_PASS=<broker_pass>
export BROKER_USER=<broker_user>
python3 -m crow.monitor.logger
```


```sh
# Collect the result
cd deploy/out
```


#### Tips

- **Horizontal Escalation**: CROW can be scaled to a cluster. Deploy a broker and the redis cache in a known/public/available machine and change the options when you call the docker entrypoints. For exampl, imagine you have your broker in `awesome-broker.me` at port 6767, just change the options in the entrypoints with `%event.host awesome-broker.me %event.port 6767` and the magic will happen.

- **Performance**: Even when we made the inferring and synthesis in a parallel process, Souper still makes the pass through functions in the bitcode module one by one. The larger the bitcode module, the larger the time during the exploration time for a single explorer. CROW will perform better if you have more than one explorer, and you pass small bitcodes to the system.