FROM aflplusplus/aflplusplus

ENV INTERFACE_PATH=/home/interface
ENV INPUT_DOCKER_AFL=/home/in
ENV OUTPUT_DOCKER_AFL=/home/out
ENV LOGS_DOCKER=/home/logs

# Create the appropriate directories
RUN mkdir -p $INTERFACE_PATH
RUN mkdir -p $INPUT_DOCKER_AFL
RUN mkdir -p $OUTPUT_DOCKER_AFL
RUN mkdir -p $LOGS_DOCKER
WORKDIR $INTERFACE_PATH

ADD ./ $INTERFACE_PATH

RUN g++ -o ./prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
RUN g++ -o ./getFileSize.out ./getFileSize.cpp ./utils.cpp
RUN g++ -o ./wait_for_server.out ./wait_for_server.cpp ./utils.cpp ./socket_client.cpp
RUN g++ -o ./interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp

RUN chmod +x $INTERFACE_PATH/entrypoint_afl.sh
