FROM jacarte/slumps:backend AS builder
env DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install curl git tree python3.7 redis-server python3-pip wget cmake lld-9 \
    && curl -sS -L -O https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-8/wasi-sdk_8.0_amd64.deb \
    && dpkg -i wasi-sdk_8.0_amd64.deb && rm -f wasi-sdk_8.0_amd64.deb \
    && rm -rf /var/lib/apt/lists/*
    

RUN python3 -m pip install pip

COPY crow/settings/config.ini /slumps/crow/settings/config.ini
COPY crow/settings/__init__.py /slumps/crow/settings/__init__.py
COPY crow/crow.py /slumps/crow/crow.py
COPY crow/iterators.py /slumps/crow/iterators.py
COPY crow/logger.py /slumps/crow/logger.py
COPY crow/stages.py /slumps/crow/stages.py
COPY crow/utils.py /slumps/crow/utils.py
COPY requirements.txt /slumps/crow/requirements.txt
COPY start_docker.sh /slumps/crow
COPY start_docker_no_wget.sh /slumps/crow
COPY start_poly_bench.sh /slumps/crow
COPY wasi /slumps/wasi
COPY headers /slumps/headers

RUN mkdir -p /slumps/crow/logs
RUN mkdir -p /slumps/crow/out

WORKDIR /slumps/crow

RUN python3 -m pip install -r requirements.txt
RUN export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
RUN export PATH=/slumps/souper/third_party/llvm-Release-install/bin:$PATH

RUN tree .

ENTRYPOINT ["./start_docker.sh"]
