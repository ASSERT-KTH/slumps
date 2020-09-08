FROM slumps/backend:latest AS builder
env DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install curl git tree python3.7 redis-server python3-pip wget cmake lld-9 \
    && curl -sS -L -O https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-8/wasi-sdk_8.0_amd64.deb \
    && dpkg -i wasi-sdk_8.0_amd64.deb && rm -f wasi-sdk_8.0_amd64.deb \
    && rm -rf /var/lib/apt/lists/*
    

RUN python3 -m pip install pip

COPY crow/crow/settings/config.ini                  /slumps/crow/crow/settings/config.ini
COPY crow/crow/settings/__init__.py                 /slumps/crow/crow/settings/__init__.py
COPY crow/crow/crow.py                              /slumps/crow/crow/crow.py
COPY crow/crow/iterators.py                         /slumps/crow/crow/iterators.py
COPY crow/crow/socket_server.py                         /slumps/crow/crow/socket_server.py
COPY crow/crow/logger.py                            /slumps/crow/crow/logger.py
COPY crow/crow/stages.py                            /slumps/crow/crow/stages.py
COPY crow/crow/utils.py                             /slumps/crow/crow/utils.py
COPY crow/requirements.txt                          /slumps/crow/requirements.txt
COPY start_poly_bench.sh                            /slumps
COPY run.sh                                         /slumps
COPY crow/headers                                   /slumps/crow/headers

RUN mkdir -p /slumps/crow/crow/logs
RUN mkdir -p /slumps/crow/crow/out

WORKDIR /slumps

RUN python3 -m pip install -r crow/requirements.txt
RUN export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
RUN export PATH=/slumps/souper/third_party/llvm-Release-install/bin:$PATH

RUN tree .

ENTRYPOINT ["./start_poly_bench.sh"]
