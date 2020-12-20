/*global chrome*/
/*global browser*/
/* src/content.js */
/*eslint no-undef: 1*/
/*eslint no-unused-expressions: 1*/

function getBinaryName(){
	return `${chrome.runtime.getURL('/static')}/js/decoder.wasm`;
}

// @ts-ignore
// @js-ignore
"INSTRUMENTOR"


window.addEventListener("message", function(event) {
	if(event.data.id === 'instrument'){
		console.log("Content script received message:", event.data, WAKOKO_INSTRUMENTOR);

		// @ts-ignore
		WAKOKO_INSTRUMENTOR().then(instrumentor => {


			var buff = new Uint8Array(event.data.buffer);	
			// @ts-ignore
			var mallocBuff = instrumentor._malloc(buff.length); 	
				
			// @ts-ignore
			var instrumentedSize = instrumentor._malloc(4); 		
			// @ts-ignore
			var global_pad = instrumentor._malloc(4); 		
			// @ts-ignore
			var global_count = instrumentor._malloc(4); 
			// @ts-ignore
			var total_instructions = instrumentor._malloc(4); 		
		
			// @ts-ignore
			instrumentor.HEAP8.set(buff, mallocBuff);
			
			// @ts-ignore
			var instrumented = instrumentor.ccall('instrument_wasm', 'number', ['number', 'number', 'number', 'number','number', 'number', 'number', 'number'],[mallocBuff, buff.length, instrumentedSize, global_pad, global_count, localStorage.getItem(`WAKOKO_BYPASSED_BLOCKS`) || 0, 0.1, total_instructions]);
		
			// @ts-ignore
			var view = new DataView(instrumentor.HEAP8.buffer);

			// @ts-ignore
			var instrumentedSize = view.getInt32(instrumentedSize, true);
			// @ts-ignore
			var global_pad = view.getInt32(global_pad, true);
			// @ts-ignore
			var global_count = view.getInt32(global_count, true);
			// @ts-ignore
			var total_instructions = view.getInt32(total_instructions, true);
			
		
			// @ts-ignore
			var instrumented_WASM_JSBuffer = instrumentor.HEAP8.slice(instrumented, instrumented + instrumentedSize);
		
			// @ts-ignore
			instrumentor._free(mallocBuff);
			//Module._free(instrumented);

			//console.log(instrumented_WASM_JSBuffer);
			console.log(instrumentedSize,  global_pad, global_count);
			

			window.postMessage({
				id: "instrumentation_result",
				instrumented: instrumented_WASM_JSBuffer,
				pad: global_pad,
				global_count: global_count
			}, "*");
			/*const listener = new WASMListener("inline", "NOT IMPLEMENTED", { }, 
				global_count,
				global_pad,
				buffer,
				instrumented_WASM_JSBuffer.buffer
				)*/

		}).catch(e => console.log(e));
	}
});

// @ts-ignore
const id = chrome.runtime.id;




//var decoderScript = document.createElement("script");

// @ts-ignore
//decoderScript.setAttribute('src', chrome.runtime.getURL('/static/js/decoder.js'));
//decoderScript.async = false;   

var scriptElement = document.createElement("script");

// @ts-ignore
scriptElement.setAttribute('src', chrome.runtime.getURL('/static/js/app.js'));
scriptElement.async = false;   

var script = document.createElement('script');
script.innerText = `WRAPPER`;
// @ts-ignore
//script.setAttribute('src', chrome.runtime.getURL('/static/js/wrapper.js'));

var metaScript = document.createElement("script");
metaScript.async = false;
metaScript.innerText = `function stats(){var script=document.createElement('script');script.onload=function(){var stats=new Stats();document.body.appendChild(stats.dom);requestAnimationFrame(function loop(){stats.update();requestAnimationFrame(loop)});};script.src='https://mrdoob.github.io/stats.js/build/stats.min.js';document.head.appendChild(script);} if(localStorage.getItem("WAKOKO_INJECT_STATS"))stats();window.staticAddress = "${
// @ts-ignore
chrome.runtime.getURL('/static')}"`;

// @ts-ignore

(document.head||document.documentElement).prepend(scriptElement);
(document.head||document.documentElement).prepend(script);
(document.head||document.documentElement).prepend(metaScript);
//(document.head||document.documentElement).prepend(decoderScript);
// TODO check for service workers
