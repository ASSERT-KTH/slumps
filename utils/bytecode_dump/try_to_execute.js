
import Long from 'long';

import fs from "fs";
import pkg from 'wasi';



const { WASI } = pkg;

const wasi = new WASI({
    args: process.argv,
    env: process.env,
    preopens: {
      '/sandbox': './'
    }
  });
  
const importObject = { wasi_snapshot_preview1: wasi.wasiImport };



async function run(){
    
    const wasm = await WebAssembly.compile(fs.readFileSync('pool/f2/[0-1].wasm'));

    const instance = await WebAssembly.instantiate(wasm, importObject);

    if(instance.exports._start || instance.exports._initialize)
      wasi.start(instance)
    else
      instance.exports.main()
};

await run()
