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

class WASMListener{

	constructor(hash, name, meta){
		this.hash = hash;
		this.meta = meta
		this.previousId = -1
		this.mem = new Array(1 << 17);
		this.unique = {}
		this.name = name
		
		this.registerVisit  = this.registerVisit.bind(this)
	}

	
	registerVisit(id) {
		/*this.unique[id] = 1
		if(this.previousId >= 0){
		  let index = (this.previousId ^ id)
		  if(isNaN(this.mem[index]))
			this.mem[index] = 0;
		  this.mem[index]++;
		  this.previousId = id >> 1;
		}else{
		  this.previousId = id
		  this.mem[this.previousId] = 1;
		}

		callBinaries()*/
	  }
}

const listeners = {

}

function callBinaries(){
	if(window.setBinaries){

		// visited={t.uniqueHitBlocks} total={t.totalBlockCount}
		window.setBinaries(Object.keys(listeners).map(k => ({
			name: listeners[k].name,
			hash: k,
			uniqueHitBlocks: Object.keys(listeners[k].unique).length,
			totalBlockCount: listeners[k].meta.totalBasicBlocks,
			totalInstructions: listeners[k].meta.totalInstructions
		})))
	}
	else
		setTimeout(() => callBinaries(), 1000)
}

WebAssembly.instantiate = function(binary, info){
	
	console.log(info)
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
			
			res.json().then(jsonData => 
			{		
				console.log("Initiating WASM...");
				listeners[jsonData.hash] = new WASMListener(jsonData.hash, jsonData.name, jsonData.metadata)
				callBinaries();

				// TODO add offset to MEM access (covSize + blockSize + 1)

				resolve(old(_base64ToArrayBuffer(jsonData.instrumented), {
					...info, swam: { // Add hit listener
						// TODO create a different listener for a different binary
						"swam_cb": listeners[jsonData.hash].registerVisit
					}
				}));
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
