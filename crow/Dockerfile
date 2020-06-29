FROM jacarte/slumps:backend AS builder
env DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install curl git tree python3.7 redis-server python3-pip wget cmake lld-9 \
    && curl -sS -L -O https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-8/wasi-sdk_8.0_amd64.deb \
    && dpkg -i wasi-sdk_8.0_amd64.deb && rm -f wasi-sdk_8.0_amd64.deb \
    && rm -rf /var/lib/apt/lists/*
    

RUN python3 -m pip install pip

COPY . /slumps/crow
COPY start_docker.sh /slumps/crow
COPY start_docker_no_wget.sh /slumps/crow



WORKDIR /slumps/crow

RUN python3 -m pip install -r requirements.txt
RUN rm settings/.slumps
RUN rm -rf out && mkdir out
RUN rm -rf logs && mkdir logs
RUN rm -rf .idea
RUN rm -rf tests
RUN rm -rf .pytest_cache
RUN rm -rf /var/lib/apt/lists/*
RUN export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
RUN export PATH=/slumps/souper/third_party/llvm/Release/bin:$PATH


ENTRYPOINT ["./start_docker.sh"]
