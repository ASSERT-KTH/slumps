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


mem = new Array(1 << 17);
previousId = -1;

function registerVisit(id) {
	if(previousId >= 0){
	  let index = (previousId ^ id)
	  if(isNaN(mem[index]))
		mem[index] = 0;
	  mem[index]++;
	  previousId = id >> 1;
	}else{
	  previousId = id
	  mem[previousId] = 1;
	}
  }

WebAssembly.instantiate = function(binary, info){
	
	return new Promise(function(resolve, reject){
		console.log("Instrumenting WASM...");
		// SEND the binary to the server to instrument

		fetch("http://localhost:5000/instrument",
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
				resolve(old(_base64ToArrayBuffer(jsonData.instrumented), {
					...info, swam: { // Add hit listener
						"swam_cb": registerVisit
					}
				}));
			}).catch(err => console.log(err));
				
		 })
		.catch(function(res){ console.log(res) })

	})
};

// INJECT Dashboard

