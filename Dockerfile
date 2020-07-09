FROM aflplusplus/aflplusplus

ENV INTERFACE_PATH=/home/interface/
ENV AFL_INPUT_DOCKER=/home/in/
ENV AFL_OUTPUT_DOCKER=/home/out/

# Create the appropriate directories
RUN mkdir -p $INTERFACE_PATH
RUN mkdir -p $AFL_INPUT_DOCKER
RUN mkdir -p $AFL_OUTPUT_DOCKER
WORKDIR $INTERFACE_PATH

ADD ./ $INTERFACE_PATH

RUN g++ -o ./prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
RUN g++ -o ./getFileSize.out ./getFileSize.cpp ./utils.cpp
RUN g++ -o ./interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp
