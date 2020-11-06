import WASMListener, { BaseWASMListener } from '../models/wasm.listener'

export class MockWasmListener extends BaseWASMListener{
	getBlockCoverage(save){
		let cv = Math.random()*17434;
		if(save){
			this.history.push(cv)
		}
		return  cv
	}
}

export class RetrieverMockService {

	createMockListeners(){
		const v1 = new MockWasmListener("testH", "test", {
			totalInstructions: 216468,
			totalBasicBlocks: 17434,
			tpe: 2,
			AFLMemOffset: 54,
			AFLMemSize: -1,
			blockCoverageMemOffset: 50,
			blockCoverageMemSize: 0},  17434, 54, [123,12,123], [123,123,123])

		

		return [v1]
	}

	getWasms(){
		return [];
	}
}