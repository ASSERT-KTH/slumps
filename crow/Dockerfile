FROM slumps/backend:latest
env DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install curl erlang git tree python3.9 redis-server wget python3.9-distutils \
    && curl -sS -L -O https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-8/wasi-sdk_8.0_amd64.deb \
    && dpkg -i wasi-sdk_8.0_amd64.deb && rm -f wasi-sdk_8.0_amd64.deb \
    
RUN curl https://wasmtime.dev/install.sh -sSf | bash

# ERLANG FOR RABBITMQ
#RUN wget -O- https://www.rabbitmq.com/rabbitmq-release-signing-key.asc | apt-key add -
#RUN wget -O- https://packages.erlang-solutions.com/ubuntu/erlang_solutions.asc | apt-key add -

#RUN echo "deb https://dl.bintray.com/rabbitmq/debian xenial main" |  tee /etc/apt/sources.list.d/bintray.rabbitmq.list
#RUN echo "deb https://packages.erlang-solutions.com/ubuntu focal contrib" |  tee /etc/apt/sources.list.d/rabbitmq.list
RUN apt-get update
RUN apt-get install -y rabbitmq-server
RUN rm -rf /var/lib/apt/lists/*

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python3.9 get-pip.py

# RUN python3.9 -m pip install pip

COPY crow                                      /slumps/crow/crow
COPY 4docker/config.ini            /slumps/crow/crow/settings/config.ini
COPY requirements.txt                          /slumps/crow/requirements.txt

COPY 4docker/launch_standalone.sh                      /slumps/crow/launch_standalone.sh
COPY 4docker/launch_standalone_bitcode.sh                      /slumps/crow/launch_standalone_bitcode.sh
COPY 4docker/launch_entrypoints.sh                      /slumps/crow/launch_entrypoints.sh
COPY 4docker/launch_exploration.sh                      /slumps/crow/launch_exploration.sh
COPY 4docker/launch_generators.sh                      /slumps/crow/launch_generators.sh
COPY 4docker/launch_logger.sh                           /slumps/crow/launch_logger.sh
COPY 4docker/launch_monitor.sh                          /slumps/crow/launch_monitor.sh
COPY 4docker/launch_storage.sh                          /slumps/crow/launch_storage.sh
COPY 4docker/launch_experiments.sh                      /slumps/crow/launch_experiments.sh
COPY 4docker/launch_storage_minio.sh                      /slumps/crow/launch_storage_minio.sh

COPY setup.py                                  /slumps/crow/setup.py
COPY run.py                                  /slumps/crow/run.py
COPY run.sh                                  /slumps/crow/run.sh

RUN mkdir -p /slumps/crow/logs
RUN mkdir -p /slumps/crow/out


WORKDIR /slumps/crow

RUN chmod +x launch_standalone.sh
RUN chmod +x launch_entrypoints.sh
RUN chmod +x launch_exploration.sh
RUN chmod +x launch_generators.sh
RUN chmod +x launch_logger.sh
RUN chmod +x launch_monitor.sh
RUN chmod +x launch_storage.sh

RUN pip3.9 install -r requirements.txt
RUN python3.9 setup.py install

RUN tree -h .

ENV BROKER_PASS quamarine
ENV BROKER_USER root
ENV REDIS_DB 0
ENV REDIS_PASS guest
ENV MINIO_ACCESS_KEY minio1
ENV MINIO_SECRET_KEY secret
ENV MINIO_HOST "min.io:9090"

#RUN python3 -m pip install -r crow/requirements.txt
RUN export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
RUN export PATH=/slumps/souper/third_party/llvm-Release-install/bin:$PATH

RUN mkdir -p /usr/src/souper/third_party/z3-install/bin
RUN cp /slumps/souper/third_party/z3-install/bin/z3 /usr/src/souper/third_party/z3-install/bin/z3

#RUN tree -h .

ENTRYPOINT ["bash", "run.sh"]
