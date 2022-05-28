import WASMListener from 'models/wasm.listener';
import IInstrumentor from './instrumentor';


export default class InsiteBasedInstrumentor implements IInstrumentor {



	instrumet(buffer: ArrayBuffer, info: any): Promise<WASMListener> {

		return new Promise((resolve, reject) => {
			setTimeout(() => {
				// @ts-ignore
				/*window.postMessage({
					id: 'instrument',
					buffer: buffer,
					message:'instrument'
				}, "*")*/

				// uncomment the following to download the original binary

				/*var atag = document.createElement("a");
				var file = new Blob([buffer],
				  {type: "application/octet-stream"});
				atag.href = URL.createObjectURL(file);
				atag.download = `module.wasm`;
				atag.click();
				atag.remove();*/

				function eventHandler(event) {
					if (event.data.id === 'instrumentation_result') {

						console.log(event);

						const listener = new WASMListener("inline", "NOT IMPLEMENTED", {},
							event.data.global_count,
							event.data.pad,
							buffer,
							event.data.instrumented.buffer
						)

						//localStorage.setItem("t1", JSON.stringify(listener));

						resolve(listener);

						window.removeEventListener("message", eventHandler);
					}
				}

				window.addEventListener("message", eventHandler)



			}, 500);

		});

	}
}