/*global chrome*/
/* src/content.js */
import "./content.css";

const id = chrome.runtime.id;



var scriptElement = document.createElement("script");
scriptElement.setAttribute('src', chrome.runtime.getURL('/static/js/app.js'));
(document.head||document.documentElement).prepend(scriptElement);

var script = document.createElement('script');
script.textContent = `

let old = window.WebAssembly.instantiate;
WebAssembly.instantiate = function(binary, info){
	console.log("Intercepted call");
	return new Promise(function(resolve, reject){
		// SEND the binary to the server to instrument
		old(binary, info).then(result => {

			window.setBinaries(binary)
			const { instance } = result;
			
			resolve(result)

		}).catch(err => console.error(err, err.stack));


	})
};

const oldInstantiateStreaming = WebAssembly.instantiateStreaming;
WebAssembly.instantiateStreaming = async (source, importObject) => {
	let response = await source;
	let buffer = await response.arrayBuffer();
	return WebAssembly.instantiate(buffer, importObject);
};


window.wasms = []
window.setBinaries = function(w){
	window.wasms.push(w)
}

`;
(document.head||document.documentElement).prepend(script);

