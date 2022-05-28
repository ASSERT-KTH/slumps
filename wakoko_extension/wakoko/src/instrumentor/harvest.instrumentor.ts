import WASMListener from 'models/wasm.listener';
import IInstrumentor from './instrumentor';



/// The purpose of this listener is just to send the binary to a server for
/// storage
export default class HarvestInstrumentor implements IInstrumentor {
    static static_counter = 0;


    async instrumet(buffer: ArrayBuffer, info: any): Promise<WASMListener> {

        let location = (window as any).window.location;
        // Sanitize
        const { hostname } = new URL(location);

        console.log("Sending to server")
        // Send to the collector server
        // @ts-ignore
        let response = await fetch(`${window.INSTRUMENTER_HOST}/store/${hostname}${HarvestInstrumentor.static_counter}`,
            {
                headers: {
                    'Accept': 'application/json', 
                    'Content-Type': 'application/json',
                    'Access-Control-Allow-Origin': '*',
                    'Access-Control-Allow-Methods': 'POST'
                },
                method: "POST",
                body: buffer,
                mode: 'no-cors'
            })
        
        HarvestInstrumentor.static_counter += 1;

        const listener = new WASMListener(
            "test",
            "page name",
            {} /* empty ? */,
            0,
            0,
            buffer,
            buffer
        )

        return listener;
    }

}