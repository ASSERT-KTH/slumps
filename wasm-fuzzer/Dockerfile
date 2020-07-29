# This Dockerfile aims to substitute the docker-compose configuration

FROM aflplusplus/aflplusplus

RUN yes | apt-get install curl
RUN apt-get update

#########################
##### Scala & Mill ######
#########################

RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN yes | apt-get install software-properties-common
RUN apt-get update
RUN yes | add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN yes | apt-get install openjdk-12-jdk-headless

# Env variables
ENV SCALA_VERSION 2.13.2
ENV MILL_VERSION 0.7.0

# Define working directory
WORKDIR /root

# Install Scala
## Piping curl directly in tar
RUN \
  curl -fsL https://downloads.typesafe.com/scala/$SCALA_VERSION/scala-$SCALA_VERSION.tgz | tar xfz - -C /root/ && \
  echo >> /root/.bashrc && \
  echo "export PATH=~/scala-$SCALA_VERSION/bin:$PATH" >> /root/.bashrc

# Install mill
RUN \
  curl -L -o /usr/local/bin/mill https://github.com/lihaoyi/mill/releases/download/$MILL_VERSION/$MILL_VERSION && \
  chmod +x /usr/local/bin/mill && \
  touch build.sc && \
  mill -i resolve _ && \
  rm build.sc

################################
#### fuzzing-server (SWAM) #####
################################

ENV DOCKER_SWAM_SRC=/home/server/src
ENV DOCKER_SWAM_OUTPUT=/home/server/out
ENV DOCKER_WASM=/home/server/wasm

# Create the appropriate directories
RUN mkdir -p $DOCKER_SWAM_SRC
RUN mkdir -p $DOCKER_SWAM_OUTPUT
RUN mkdir -p $DOCKER_WASM

WORKDIR $DOCKER_SWAM_SRC

# TODO: Find way of installing dependencies with Mill without copying over entire repo
# See: https://stackoverflow.com/questions/62834693/mill-build-tool-install-dependencies-without-compiling-source-code

ADD ./fuzzing-server $DOCKER_SWAM_SRC

RUN chmod +x $DOCKER_SWAM_SRC/entrypoint_mill_server.sh

# For maven data:
VOLUME /root/.cache/coursier/v1/https/repo1.maven.org/maven2
# For compiled sources:
VOLUME $DOCKER_SWAM_SRC/out/

#############################
#### fuzzing-client-afl #####
#############################

ENV DOCKER_INTERFACE_SRC=/home/client/interface
ENV DOCKER_AFL_INPUT=/home/client/in
ENV DOCKER_AFL_OUTPUT=/home/client/out

# Create the appropriate directories
RUN mkdir -p $DOCKER_INTERFACE_SRC
RUN mkdir -p $DOCKER_AFL_INPUT
RUN mkdir -p $DOCKER_AFL_OUTPUT
WORKDIR $DOCKER_INTERFACE_SRC

ADD ./fuzzing-client-afl $DOCKER_INTERFACE_SRC

RUN g++ -o ./prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
RUN g++ -o ./getFileSize.out ./getFileSize.cpp ./utils.cpp
RUN g++ -o ./wait_for_server.out ./wait_for_server.cpp ./utils.cpp ./socket_client.cpp
RUN g++ -o ./interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp

RUN chmod +x $DOCKER_INTERFACE_SRC/entrypoint_afl.sh

#########################
######## Shared #########
#########################

ENV DOCKER_SHARED=/home/shared
ENV DOCKER_LOGS=$DOCKER_SHARED/logs

RUN mkdir -p $DOCKER_LOGS

ADD ./entrypoint.sh $DOCKER_SHARED

RUN chmod +x $DOCKER_SHARED/entrypoint.sh

ENTRYPOINT $DOCKER_SHARED/entrypoint.sh