import {Utils} from 'instrumentor/instrumentor'
import './content.css';




const oldModule = WebAssembly.Module;
// @ts-ignore
WebAssembly.Module =  null;
// @ts-ignore

WebAssembly.instantiateStreaming = null

// @ts-ignore
WebAssembly.Instance =  null;

// @ts-ignore
window.INSTRUMENTER_HOST = "http://localhost:8080"
// @ts-ignore
window.old_instantiate = WebAssembly.instantiate;

let old = window.WebAssembly.instantiate;
// @ts-ignore
WebAssembly.instantiate = null

console.log("REPLACING API..")

function wrapper(binary, info){
	console.log("Intercepted call");
	return new Promise(async function(resolve, reject){

		let instrumetor = Utils.getInstrumentor()

		const instrumentation = await instrumetor.instrumet(binary, info);

		old(new Uint8Array(instrumentation.instrumented), info).then(result => {
			

			const { instance } = result;
			console.log(instance);
			instrumentation.setModuleRef(instance)
			// @ts-ignore
			window.setBinaries(instrumentation)
			resolve(result)

		}).catch(err => console.error(err, err.stack));


	})
};


// @ts-ignore
WebAssembly.instantiate = wrapper

// @ts-ignore
WebAssembly.instantiateStreaming = async (source, importObject) => {
	console.log("WRAPPING")
	let response = await source;
	let buffer = await response.arrayBuffer();
	return wrapper(buffer, importObject);
};

// @ts-ignore
window.wasms = []
// @ts-ignore
window.setBinaries = function(w){
	// @ts-ignore
	window.wasms.push(w)

	console.warn("NO DASHBOARD CALLBACK")
}
// @ts-ignore
window.IS_EXTENSION = true; 
// @ts-ignore
window.ENABLE_DASHBOARD = true; 
// @ts-ignore
window.PRODUCTION = true; 
