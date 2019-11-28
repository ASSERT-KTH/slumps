from wasmer import Instance

wasm_bytes = open('simple.wasm', 'rb').read()
instance = Instance(wasm_bytes)
result = instance.exports.sum(5, 37)

print(result)  # 42!
