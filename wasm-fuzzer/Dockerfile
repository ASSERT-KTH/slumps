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

# RUN yes | apt-get install openjdk-12-jdk-headless

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

ENV REPO_PATH_DOCKER=/home/server/src
ENV SWAM_OUTPUT_DOCKER=/home/server/out
ENV WASM_PATH_DOCKER=/home/server/wasm

# Create the appropriate directories
RUN mkdir -p $REPO_PATH_DOCKER
RUN mkdir -p $SWAM_OUTPUT_DOCKER
RUN mkdir -p $WASM_PATH_DOCKER

WORKDIR $REPO_PATH_DOCKER

# TODO: Find way of installing dependencies with Mill without copying over entire repo
# See: https://stackoverflow.com/questions/62834693/mill-build-tool-install-dependencies-without-compiling-source-code

ADD ./fuzzing-server $REPO_PATH_DOCKER

RUN chmod +x $REPO_PATH_DOCKER/entrypoint_mill_server.sh

#############################
#### fuzzing-client-afl #####
#############################

ENV INTERFACE_PATH=/home/client/interface
ENV INPUT_DOCKER_AFL=/home/client/in
ENV OUTPUT_DOCKER_AFL=/home/client/out

# Create the appropriate directories
RUN mkdir -p $INTERFACE_PATH
RUN mkdir -p $INPUT_DOCKER_AFL
RUN mkdir -p $OUTPUT_DOCKER_AFL
WORKDIR $INTERFACE_PATH

ADD ./fuzzing-client-afl $INTERFACE_PATH

RUN g++ -o ./prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
RUN g++ -o ./getFileSize.out ./getFileSize.cpp ./utils.cpp
RUN g++ -o ./wait_for_server.out ./wait_for_server.cpp ./utils.cpp ./socket_client.cpp
RUN g++ -o ./interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp

RUN chmod +x $INTERFACE_PATH/entrypoint_afl.sh

#########################
######## Shared #########
#########################

ENV SHARED_DOCKER=/home/shared
ENV LOGS_DOCKER=$SHARED_DOCKER/logs

# RUN mkdir -p $SHARED_DOCKER
RUN mkdir -p $LOGS_DOCKER

ADD ./entrypoint.sh $SHARED_DOCKER

RUN chmod +x $SHARED_DOCKER/entrypoint.sh

ENTRYPOINT $SHARED_DOCKER/entrypoint.sh