#!/bin/bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

echo "Cloning SWAM"
if [ ! -d fuzzing-server-swam ]; then
	git clone --single-branch --branch feature/swam-server https://github.com/KTH/swam.git fuzzing-server-swam
fi

echo "Building SWAM"
cd fuzzing-server-swam
git pull
./millw cli.assembly
export SWAM_JAR=$(CURRENT_DIR)/fuzzing-server-swam/out/cli/assembly/dest/out.jar
echo $SWAM_JAR
cd ..


# Download afl plus plus
if [ ! -d aflpp ]; then
	echo "Downloading aflplusplus..."
	git clone https://github.com/AFLplusplus/AFLplusplus.git aflpp

	echo "Building aflplusplus..."
	cd aflpp
	make distrib
	sudo make install
	cd ..
fi


echo "Building the wafl interface..."

mkdir -p $CURRENT_DIR/wafl-temp
CPP_OUT_DIR=$CURRENT_DIR/wafl-temp/cpp-out
mkdir -p $CPP_OUT_DIR

g++ -o $CPP_OUT_DIR/prepare_wasm_input.out ./fuzzing-client-afl/prepare_wasm_input.cpp ./fuzzing-client-afl/utils.cpp
g++ -o $CPP_OUT_DIR/getFileSize.out ./fuzzing-client-afl/getFileSize.cpp ./fuzzing-client-afl/utils.cpp
g++ -o $CPP_OUT_DIR/wait_for_server.out ./fuzzing-client-afl/wait_for_server.cpp ./fuzzing-client-afl/utils.cpp ./fuzzing-client-afl/socket_client.cpp
g++ -o $CPP_OUT_DIR/run_client.out ./fuzzing-client-afl/run_client.cpp ./fuzzing-client-afl/socket_client.cpp ./fuzzing-client-afl/utils.cpp
g++ -o $CPP_OUT_DIR/interface.out ./fuzzing-client-afl/interface.cpp ./fuzzing-client-afl/socket_client.cpp ./fuzzing-client-afl/utils.cpp

echo "DONE !" 