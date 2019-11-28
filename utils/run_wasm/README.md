# run WASM file outside the web

## using wasmer

1. install wasmer (NOT recommend to use Windows)
```bash
curl https://get.wasmer.io -sSfL | sh
```

more info, check [this repo](https://github.com/wasmerio/wasmer#introduction)

2. install the Python library
```bash
pip3 install wasmer
```

more info, check [this repo](https://github.com/wasmerio/python-ext-wasm#install)

3. try to run the given demo
```bash
python3 run_simple.py
```

## using wasmtime

1. install wasmtime (NOT recommend to use Windows)
```bash
curl https://wasmtime.dev/install.sh -sSf | bash
```

more info, check [this repo](https://github.com/bytecodealliance/wasmtime#wasmtime-a-webassembly-runtime)

2. try to run the given demo
```bash
wasmtime simple.wasm
```
