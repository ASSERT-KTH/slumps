
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
		this.history = [ ];

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
}

export default class WASMListener extends BaseWASMListener{

	
	getBlockCoverage(save){
		let sum = 0
		for(let i = this.offset; i < this.offset + this.totalBlocks - 1; i++){
			const name = `cg${i}`
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
		return sum;
	}


	

}
