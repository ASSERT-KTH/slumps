/*global chrome*/
/* src/content.js */
import "./content.css";

// @ts-ignore
const id = chrome.runtime.id;



var scriptElement = document.createElement("script");

// @ts-ignore
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

window.cssStyleAddress = "${
	// @ts-ignore
	chrome.runtime.getURL('/static/css/content.css')}"
`;
(document.head||document.documentElement).prepend(script);

