FROM jacarte/slumps:backend AS builder
env DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install git tree python3.7 redis-server python3-pip wget cmake

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


ENTRYPOINT ["./start_docker.sh"]
