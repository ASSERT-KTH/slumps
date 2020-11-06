# This Dockerfile aims to substitute the docker-compose configuration

FROM aflplusplus/aflplusplus

################
##### JVM ######
################

RUN yes | apt-get install curl
RUN apt-get update
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata wget
RUN apt-get update
RUN yes | apt-get install software-properties-common
RUN apt-get update
RUN yes | add-apt-repository ppa:openjdk-r/ppa
RUN apt-get update
RUN yes | apt-get install openjdk-12-jdk-headless

#######################
##### Supervisor ######
#######################

RUN apt-get install -y supervisor

# Define working directory
WORKDIR /root

################################
##### fuzzing-server-swam ######
################################

ENV SRC_SWAM_DIR=/home/server/src
ENV WASM_DIR=/home/server/wasm

# Create the appropriate directories
RUN mkdir -p $SRC_SWAM_DIR
RUN mkdir -p $WASM_DIR

WORKDIR $SRC_SWAM_DIR

# TODO: Find way of installing dependencies with Mill without copying over entire repo
# See: https://stackoverflow.com/questions/62834693/mill-build-tool-install-dependencies-without-compiling-source-code

# DOWNLOAD latest version of SWAM cli jar file (wget into WORKDIR; wget works with cache in Dockerfile)
RUN wget https://github.com/KTH/swam/releases/download/v0.6.0-RC3/swam_cli.jar
RUN wget https://github.com/KTH/swam/releases/download/v0.6.0-RC3/swam_server.jar

ADD entrypoint_mill_server.sh /home
RUN chmod +x /home/entrypoint_mill_server.sh

#############################
#### fuzzing-client-afl #####
#############################

ENV SRC_INTERFACE_DIR=/home/client/interface
ENV OUT_INTERFACE_DIR=/home/client/interface/cpp_out
ENV INPUT_AFL_DIR=/home/client/in
ENV OUTPUT_AFL_DIR=/home/client/out

# Create the appropriate directories
RUN mkdir -p $SRC_INTERFACE_DIR
RUN mkdir -p $OUT_INTERFACE_DIR
RUN mkdir -p $INPUT_AFL_DIR
RUN mkdir -p $OUTPUT_AFL_DIR
WORKDIR $SRC_INTERFACE_DIR

ADD ./fuzzing-client-afl $SRC_INTERFACE_DIR

RUN g++ -o $OUT_INTERFACE_DIR/prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
RUN g++ -o $OUT_INTERFACE_DIR/getFileSize.out ./getFileSize.cpp ./utils.cpp
RUN g++ -o $OUT_INTERFACE_DIR/wait_for_server.out ./wait_for_server.cpp ./utils.cpp ./socket_client.cpp
RUN g++ -o $OUT_INTERFACE_DIR/interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp

RUN chmod +x $SRC_INTERFACE_DIR/*.sh

#########################
######## Shared #########
#########################

ENV WAFL_HOME=/home
WORKDIR $WAFL_HOME

ENV LOGS_DIR=$WAFL_HOME/logs

RUN mkdir -p $LOGS_DIR

ADD supervisord.conf .
ADD supervisord.staging.conf .
ADD stop_supervisord_staging.py .

# dockerignore handles others
ADD *.sh ./

RUN chmod +x ./*.sh
RUN chmod +x ./stop_supervisord_staging.py

ENTRYPOINT ["/home/wafl.sh"]
