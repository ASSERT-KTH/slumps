
export class Node {
	children: {
		[key: number]: boolean
	}

	constructor(){
		this.children = { }
	}
}

export abstract class BaseWASMListener{
	hash: string;
	meta: any;
	name: string;
	module: any;
	offset: number;
	totalBlocks: number;
	history: number[];
	original: ArrayBuffer;
	instrumented: ArrayBuffer;
	nodes: {
		[key: number]: boolean
	}
	links: {
		target: number,
		source: number
	}[] 
	
	constructor(hash, name, meta, totalBlocks, offset, original, instrumented){
		this.hash = hash;
		this.meta = meta
		this.name = name
		this.offset=offset;
		this.totalBlocks = totalBlocks;
		this.history = [0];

		this.original = original;
		this.instrumented = instrumented;

		this.nodes = []
		this.links = []


		this.getBlockCoverage = this.getBlockCoverage.bind(this);
		this.setModuleRef = this.setModuleRef.bind(this);
	}

	setModuleRef(moduleRef: any){
		this.module = moduleRef;
	}

	get lastVisited(){
		return this.history.slice(-1)[0] 
	}

	abstract getBlockCoverage(save): number;
	abstract setVisitedMap(save): void;

}

export default class WASMListener extends BaseWASMListener{

	setVisitedMap(save: any): void {
		/*for(let i = this.offset; i < this.offset + this.totalBlocks - 1; i++){
			const name = `c${i}`
			//console.log(name)
			if(name in this.module.exports)
			{
				const value = this.module.exports[name].value
				if(value)
					this.blockMap[i - this.offset] = value
			}
		}*/

	}

	
	getBlockCoverage(save){
		let sum = 0
		//console.log(this.offset, this.totalBlocks, this.module.exports, this.module.exports["c51"]);
		for(let i = this.offset; i < this.offset + this.totalBlocks - 1; i++){
			const name = `c${i}`
			//console.log(name)
			if(name in this.module.exports)
			{
				const value = this.module.exports[name].value
				if(value)
					sum += 1
			}
		}

		if(save){
			this.history.push(sum)
		}
		//console.log(sum);
		return sum;
	}

}
