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

ADD ./fuzzing-server-entry/entrypoint_mill_server.sh $SRC_SWAM_DIR

# DOWNLOAD latest version of SWAM cli jar file
ADD https://github.com/KTH/swam/releases/download/v0.6.0-RC3/cli-0.6.0-RC3.jar $SRC_SWAM_DIR


RUN chmod +x $SRC_SWAM_DIR/entrypoint_mill_server.sh

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

RUN chmod +x $SRC_INTERFACE_DIR/entrypoint_afl.sh

#########################
######## Shared #########
#########################

ENV LOGS_DIR=/home/shared/logs

RUN mkdir -p $LOGS_DIR

ADD supervisord.conf /home/supervisord.conf
ADD wafl.sh /home/wafl.sh
ADD prepare_env.sh /home/prepare_env.sh

RUN chmod +x /home/wafl.sh
RUN chmod +x /home/prepare_env.sh

ENTRYPOINT ["/home/wafl.sh"]
