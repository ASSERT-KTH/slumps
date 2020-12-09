
const fs = require("fs")
const WASI = require('wasi');



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
	"/Users/javierca/Documents/Develop/slumps/benchmark_programs/new_iteration/ISBN13_check_digit_test/[7-1][8-9][9-1][10-15].wasm")

WebAssembly.instantiate(sbuff, importObject).then(result => {

	const { instance } = result;

    wasi.setMemory(instance.exports.memory);

    if(instance.exports._start)
      instance.exports._start()
    else
      instance.exports.main()
	  
})