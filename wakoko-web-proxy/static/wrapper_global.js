
const oldTimeout = setInterval

fetch(`${window.INSTRUMENTER_HOST}/instrument`, {
	headers: {
		'Accept': 'application/json',
		'Content-Type': 'application/json',
		'Access-Control-Allow-Origin': '*',
		//'Access-Control-Allow-Methods': 'POST'	
			},
		method: "POST"
}).then(() => {}).catch(e => {
	if(confirm(`It seems that your browser does not trust in wakoko ${e}. Press OK to open a new tab in ${window.INSTRUMENTER_HOST} to enable it.`)){
		window.open(window.INSTRUMENTER_HOST, "_blank");

		setTimeout(() => location.reload(), 5000);
	}
})


console.log("Wrapping WASM API...");
let old = WebAssembly.instantiate;

const listeners = {

}

let time = null;

function callBinaries(){
	if(window.setBinaries){

		// visited={t.uniqueHitBlocks} total={t.totalBlockCount}
		window.setBinaries(Object.keys(listeners).map(k => {
			listeners[k].getCoverage(true);

			return {
				name: listeners[k].name,
				hash: k,
				uniqueHitBlocks: listeners[k].history,
				totalBlockCount: listeners[k].meta.totalBasicBlocks,
				totalInstructions: listeners[k].meta.totalInstructions,
				rate: window.WAKOKO_RATE
			}
		}))
	}
}

const MAX_BUFFER_SIZE = 200
let delayCounter = 0

class WASMListener{

	constructor(hash, name, meta, totalBlocks, moduleRef, offset){
		this.hash = hash;
		this.meta = meta
		this.previousId = -1
		this.unique = {}
		this.name = name
		this.module = moduleRef;
		this.offset=offset;
		this.totalBlocks = totalBlocks;
		this.history = [ ];

		this.getCoverage = this.getCoverage.bind(this);

	}

	getCoverage(save){
		//console.log(this.module.exports)
		let sum = 0
		for(let i = this.offset; i < this.offset + this.totalBlocks - 1; i++){
			const name = `cg${i}`
			//console.log(name)
			if(name in this.module.exports)
				sum += this.module.exports[name].value
		}

		if(save)
			this.history.push(sum)

		return sum;
	}

}

// fall-back to regular instantiation
const oldInstantiateStreaming = WebAssembly.instantiateStreaming;
WebAssembly.instantiateStreaming = async (source, importObject) => {
	let response = await source;
	let buffer = await response.arrayBuffer();
	return WebAssembly.instantiate(buffer, importObject);
};

console.log("WRAPPING API...");
WebAssembly.instantiate = function(binary, info){

	return new Promise(function(resolve, reject){
		console.log("Instrumenting WASM...");
		// SEND the binary to the server to instrument

		fetch(`${window.INSTRUMENTER_HOST}/instrument`,
		{
			headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json',
			'Access-Control-Allow-Origin': '*',
			//'Access-Control-Allow-Methods': 'POST'	
				},
			method: "POST",
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



				old(new Uint8Array(jsonData.instrumented), info).then(result => {

					const { instance } = result;

					const listener = new WASMListener(jsonData.hash, jsonData.name, jsonData.metadata, 
						jsonData.metadata.totalBasicBlocks,
						instance,
						jsonData.metadata.AFLMemOffset
						)
					listeners[jsonData.hash] = listener
					
					console.log("Instrumented")
					if(!time){
						callBinaries()
						time = oldTimeout(() => {
							callBinaries()
						}, window.WAKOKO_RATE)
					}
					resolve(result)

				}).catch(err => console.error(err, err.stack));

				
			}).catch(err => console.log(err));
				
		 })
		.catch(function(res){ console.log(res) })

	})
};

