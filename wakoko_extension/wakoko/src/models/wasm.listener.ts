
export default class WASMListener{

	hash: string;
	meta: any;
	name: string;
	module: any;
	offset: number;
	totalBlocks: number;
	history: number[];
	original: ArrayBuffer;
	instrumented: ArrayBuffer;

	constructor(hash, name, meta, totalBlocks, offset, original, instrumented){
		this.hash = hash;
		this.meta = meta
		this.name = name
		this.offset=offset;
		this.totalBlocks = totalBlocks;
		this.history = [ ];

		this.original = original;
		this.instrumented = instrumented;

		this.getCoverage = this.getCoverage.bind(this);
		this.setModuleRef = this.setModuleRef.bind(this);

	}

	setModuleRef(moduleRef: any){
		this.module = moduleRef;
	}

	get lastVisited(){
		return this.history.slice(-1)[0] 
	}

	getCoverage(save){
		let sum = 0
		for(let i = this.offset; i < this.offset + this.totalBlocks - 1; i++){
			const name = `cg${i}`
			//console.log(name)
			if(name in this.module.exports)
				sum += this.module.exports[name].value
		}

		if(save){
			this.history.push(sum)
		}
		return sum;
	}

}
