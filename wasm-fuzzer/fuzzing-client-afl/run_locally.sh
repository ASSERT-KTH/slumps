sudo rm -rf cpp_out

export DOCKER_INTERFACE_SRC=$(pwd)/cpp_out
export DOCKER_AFL_INPUT=$(pwd)/cpp_out/in
export SWAM_SOCKET_PORT=9999
export SWAM_SOCKET_HOST=0.0.0.0

export DOCKER_AFL_OUTPUT=out
export REQUIRED_BYTES=4

export WASM_ARG_TYPES_LIST=Int32,Int32
export WASM_ARG_LIST=15,15
export DOCKER_LOGS=$(pwd)/cpp_out/out
export DUMMY_TESTING_AFL=False

if [ ! -d cpp_out ]; then
	mkdir cpp_out
	mkdir -p cpp_out/in
	bash build.sh
fi

# Download afl plus plus
if [ ! -d aflpp ]; then
	 git clone https://github.com/AFLplusplus/AFLplusplus.git aflpp

	cd aflpp
	make distrib
	sudo make install
	cd ..
fi

export AFL="$(pwd)/aflpp/afl-fuzz"
export LOCAL_AFL="True"

bash entrypoint_afl.sh