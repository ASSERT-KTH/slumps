from wasmer import Module

wasm_bytes = open('aes/aes.cpp.0.o', 'rb').read()
module = Module(wasm_bytes)
instance = module.instantiate()
# result = instance.exports.sum(5, 37)

print(result)  # 42!
