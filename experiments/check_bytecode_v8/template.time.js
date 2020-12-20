
const fs = require("fs")
const WASI = require('wasi');
const {performance} = require('perf_hooks');



// const { WASI } = pkg;

const wasi = new WASI({
    args: process.argv,
    env: process.env,
    preopens: {
      '/sandbox': './'
    }
  });

const importObject = { wasi_snapshot_preview1: wasi.exports };


const sbuff = fs.readFileSync(
	"WASM_BINARY")

WebAssembly.instantiate(sbuff, importObject).then(result => {

	const { instance } = result;

    wasi.setMemory(instance.exports.memory);

    let f = null
    if(instance.exports._start)
      f = instance.exports._start
    else
      f = instance.exports.main
    
    const start = performance.now()
    f()
    const delta = performance.now() - start

    fs.appendFileSync(process.argv[2], `,${delta}`)
})