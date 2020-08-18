FROM aflplusplus/aflplusplus

ENV DOCKER_INTERFACE_SRC=/home/interface
ENV DOCKER_AFL_INPUT=/home/in
ENV DOCKER_AFL_OUTPUT=/home/out
ENV DOCKER_LOGS=/home/logs

# Create the appropriate directories
RUN mkdir -p $DOCKER_INTERFACE_SRC
RUN mkdir -p $DOCKER_AFL_INPUT
RUN mkdir -p $DOCKER_AFL_OUTPUT
RUN mkdir -p $DOCKER_LOGS
WORKDIR $DOCKER_INTERFACE_SRC

ADD ./ $DOCKER_INTERFACE_SRC

RUN g++ -o ./prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
RUN g++ -o ./getFileSize.out ./getFileSize.cpp ./utils.cpp
RUN g++ -o ./wait_for_server.out ./wait_for_server.cpp ./utils.cpp ./socket_client.cpp
RUN g++ -o ./interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp

RUN chmod +x $DOCKER_INTERFACE_SRC/entrypoint_afl.sh
