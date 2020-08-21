g++ -o cpp_out/prepare_wasm_input.out ./prepare_wasm_input.cpp ./utils.cpp
g++ -o cpp_out/getFileSize.out ./getFileSize.cpp ./utils.cpp
g++ -o cpp_out/wait_for_server.out ./wait_for_server.cpp ./utils.cpp ./socket_client.cpp
g++ -o cpp_out/interface.out ./interface.cpp ./socket_client.cpp ./utils.cpp
