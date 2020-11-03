import WASMListener from "models/wasm.listener";
import ServerBasedInstrumentor from "./server.based.instrumentor";

export default interface IInstrumentor {

	instrumet(buffer: ArrayBuffer, info: any): Promise<WASMListener>;

}

export class Utils{
	static getInstrumentor(): IInstrumentor{
		return new ServerBasedInstrumentor();
	}
}