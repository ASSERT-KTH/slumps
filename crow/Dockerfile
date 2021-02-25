FROM slumps/backend:latest
env DEBIAN_FRONTEND=noninteractive


RUN apt-get update \
    && apt-get -y install curl git tree python3.7 redis-server python3-pip wget \
    && curl -sS -L -O https://github.com/CraneStation/wasi-sdk/releases/download/wasi-sdk-8/wasi-sdk_8.0_amd64.deb \
    && dpkg -i wasi-sdk_8.0_amd64.deb && rm -f wasi-sdk_8.0_amd64.deb \
    && rm -rf /var/lib/apt/lists/*


RUN python3 -m pip install pip

COPY crow                                      /slumps/crow/crow
COPY crow/settings/config.docker.ini            /slumps/crow/crow/settings/config.ini
COPY requirements.txt                          /slumps/crow/requirements.txt

COPY 4docker/launch_standalone.sh                      /slumps/crow/launch_standalone.sh
COPY 4docker/launch_entrypoints.sh                      /slumps/crow/launch_entrypoints.sh
COPY 4docker/launch_exploration.sh                      /slumps/crow/launch_exploration.sh
COPY 4docker/launch_generators.sh                      /slumps/crow/launch_generators.sh
COPY 4docker/launch_logger.sh                           /slumps/crow/launch_logger.sh
COPY 4docker/launch_monitor.sh                          /slumps/crow/launch_monitor.sh
COPY 4docker/launch_storage.sh                          /slumps/crow/launch_storage.sh
COPY setup.sh                                   /slumps/crow/setup.sh

COPY setup.py                                  /slumps/crow/setup.py
COPY headers                                   /slumps/crow/headers

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

RUN pip3 install -r requirements.txt
RUN python3 setup.py install

RUN tree -h .

#RUN python3 -m pip install -r crow/requirements.txt
RUN export LD_LIBRARY_PATH=/slumps/souper/third_party/alive2/build/:/slumps/souper/build:/slumps/souper/third_party/z3-install/lib::$LD_LIBRARY_PATH
RUN export PATH=/slumps/souper/third_party/llvm-Release-install/bin:$PATH

RUN mkdir -p /usr/src/souper/third_party/z3-install/bin
RUN cp /slumps/souper/third_party/z3-install/bin/z3 /usr/src/souper/third_party/z3-install/bin/z3

#RUN tree -h .

ENTRYPOINT ["bash", "launch_standalone.sh"]
