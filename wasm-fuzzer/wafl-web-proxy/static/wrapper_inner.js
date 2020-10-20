
console.log("Wrapping WASM API...");
let old = WebAssembly.instantiate;

function _base64ToArrayBuffer(base64) {
    var binary_string = window.atob(base64);
    var len = binary_string.length;
    var bytes = new Uint8Array(len);
    for (var i = 0; i < len; i++) {
        bytes[i] = binary_string.charCodeAt(i);
    }
    return bytes.buffer;
}

const listeners = {

}

function callBinaries(){
	if(window.setBinaries){

		// visited={t.uniqueHitBlocks} total={t.totalBlockCount}
		window.setBinaries(Object.keys(listeners).map(k => ({
			name: listeners[k].name,
			hash: k,
			uniqueHitBlocks: listeners[k].uniqueBlocksCount,
			totalBlockCount: listeners[k].meta.totalBasicBlocks,
			totalInstructions: listeners[k].meta.totalInstructions
		})))
	}
	setTimeout(() => callBinaries(), 5000)
}

const MAX_BUFFER_SIZE = 200
let delayCounter = 0

class WASMListener{

	constructor(hash, name, meta, coverageMemOffset, coverageMemSize, blockCoverageMemOffset, blockCoverageMemSize, memRef){
		this.hash = hash;
		this.meta = meta
		this.previousId = -1
		this.unique = {}
		this.name = name

		this.coverageMemOffset = coverageMemOffset;
		this.coverageMemSize = coverageMemSize;
		this.memRef = memRef;

		this.blockCoverageMemOffset = blockCoverageMemOffset;
		this.blockCoverageMemSize = blockCoverageMemSize;

		console.log(coverageMemOffset, coverageMemSize)

		this.getAFLMemoryCoverageSlice = this.getAFLMemoryCoverageSlice.bind(this)
		this.getBlockCoverage = this.getBlockCoverage.bind(this)

	}

	getAFLMemoryCoverageSlice(){
		let coverage = this.memRef.buffer.slice(this.coverageMemOffset, this.coverageMemSize + this.coverageMemOffset)
		return coverage;
	}


	getBlockCoverage(){
		let coverage = this.memRef.buffer.slice(this.blockCoverageMemOffset, this.blockCoverageMemSize + this.blockCoverageMemOffset)
		return coverage;
	}

	get uniqueBlocksCount(){
		const uint8 = new Uint8Array(this.getBlockCoverage());		
		console.log(uint8)
		return uint8.reduce((a, b) => a + b)
	}
}

WebAssembly.instantiateStreaming = null;


WebAssembly.instantiate = function(binary, info){

	return new Promise(function(resolve, reject){
		console.log("Instrumenting WASM...");
		// SEND the binary to the server to instrument

		fetch(`${window.INSTRUMENTER_HOST}/instrument`,
		{
			headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json',
			'Access-Control-Allow-Origin': '*'
			},
			method: "POST",
			cache: "no-cache",
			body: binary,
			//mode: 'no-cors'
		})
		.then(function(res){ 
			
			res.json().then(async jsonData => 
			{		

				if("env" in info){
					if("memory" in info.env){
						//console.log("GROWING MEMORY...")
						//console.log(info.env.memory.grow(2))
					}
				}
				// Look for memory in the info object and replace by a wrapper

				console.log("Initiating WASM...");



				old(_base64ToArrayBuffer(jsonData.instrumented), info).then(result => {

					const { instance } = result;

					listeners[jsonData.hash] = new WASMListener(jsonData.hash, jsonData.name, jsonData.metadata, 
						jsonData.metadata.AFLMemOffset, 
						jsonData.metadata.AFLMemSize,
						jsonData.metadata.blockCoverageMemOffset,
						jsonData.metadata.blockCoverageMemSize,
						instance.exports.__mem
						)
	
						
		
					//callBinaries()
					resolve(result)

				}).catch(err => console.error(err, err.stack));

				
			}).catch(err => console.log(err));
				
		 })
		.catch(function(res){ console.log(res) })

	})
};




// INJECT Dashboard
console.log("Injecting DASHBOARD...");
const app = document.createElement('script');

if(window.INSTRUMENTER_HOST)
	app.src = `${window.INSTRUMENTER_HOST}/static/index.js`;

window.onload = function(e){
	document.body.appendChild(app);
}
