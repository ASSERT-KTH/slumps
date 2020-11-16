import WASMListener from 'models/wasm.listener';
import IInstrumentor from './instrumentor';


export default class InsiteBasedInstrumentor implements IInstrumentor {



	instrumet(buffer: ArrayBuffer, info: any): Promise<WASMListener> {

		return new Promise((resolve, reject)=>{
			setTimeout(() => {
				// @ts-ignore
				window.postMessage({
					id: 'instrument',
					buffer: buffer,
					message:'instrument'
				}, "*")

				function eventHandler(event){
					if(event.data.id === 'instrumentation_result'){

						console.log(event);

						const listener = new WASMListener("inline", "NOT IMPLEMENTED", { }, 
							event.data.global_count,
							event.data.pad,
							buffer,
							event.data.instrumented.buffer
							)
				
						resolve(listener);

						window.removeEventListener("message", eventHandler);
					}
				}

				window.addEventListener("message", eventHandler)
				/*
				// @ts-ignore
				 WAKOKO_INSTRUMENTOR().then(instrumentor => {


					var buff = new Uint8Array(buffer);	
					// @ts-ignore
					var mallocBuff = instrumentor._malloc(buffer.buff); 	
						
					// @ts-ignore
					var instrumentedSize = instrumentor._malloc(4); 		
					// @ts-ignore
					var global_pad = instrumentor._malloc(4); 		
					// @ts-ignore
					var global_count = instrumentor._malloc(4); 	
				
					// @ts-ignore
					instrumentor.HEAP8.set(buff, mallocBuff);
						
					// @ts-ignore
					var instrumented = instrumentor.ccall('instrument_wasm', 'number', ['number', 'number', 'number', 'number','number'],[mallocBuff, buff.length, instrumentedSize, global_pad, global_count]);
				
					// @ts-ignore
					var view = new DataView(wasmMemory.buffer);
			
					// @ts-ignore
					var instrumentedSize = view.getInt32(instrumentedSize, true);
					// @ts-ignore
					var global_pad = view.getInt32(global_pad, true);
					// @ts-ignore
					var global_count = view.getInt32(global_count, true);
					
				
					// @ts-ignore
					var instrumented_WASM_JSBuffer = instrumentor.HEAP8.slice(instrumented, instrumented + instrumentedSize);
				
					// @ts-ignore
					instrumentor._free(mallocBuff);
					//Module._free(instrumented);
			
					//console.log(instrumented_WASM_JSBuffer);
					//console.log(instrumentedSize,  global_pad, global_count);
					
					resolve(listener);
				});*/


			}, 500);
	
		});
		
	}
}