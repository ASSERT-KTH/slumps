import WASMListener from 'models/wasm.listener';
import IInstrumentor from './instrumentor';


export default class ServerBasedInstrumentor implements IInstrumentor {
	async instrumet(buffer: ArrayBuffer, info: any): Promise<WASMListener> {

		// @ts-ignore
		let response = await fetch(`${window.INSTRUMENTER_HOST}/instrument`,
		{
			headers: {
			'Accept': 'application/json',
			'Content-Type': 'application/json',
			'Access-Control-Allow-Origin': '*',
			//'Access-Control-Allow-Methods': 'POST'	
				},
			method: "POST",
			body: buffer,
			//mode: 'no-cors'
		})

		let jsonData = await response.json();


		const listener = new WASMListener(jsonData.hash, jsonData.name, jsonData.metadata, 
			jsonData.metadata.totalBasicBlocks,
			jsonData.metadata.AFLMemOffset,
			buffer,
			jsonData.instrumented
			)

		return listener;
	}
}