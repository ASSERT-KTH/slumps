
import Node from '../models/node';

export default class Squarifyier{

	width: number;
	height: number;
	xoffset: number;
	yoffset: number;
	children: Node[];
	placed: Node[];

	constructor(xoffset, yoffset, width, height, children: Node[]){
		console.log("SQ")
		this.width = width;
		this.height = height;
		this.xoffset = xoffset;
		this.yoffset = yoffset;
		this.children = children;
		this.placed = []
	}

	get ratio(){
		return [this.width/this.height, this.height/this.width]
	}

	getSize(node: Node){
		return node.children.length || 1;
	}

	getTotalArea(){
		let sum = 0;
		this.children.forEach(t => sum += this.getSize(t))

		return sum;
	}

	getCurrentRatio(w){
		const max =  Math.max.apply(Math, this.children.map(t =>this.getSize(t)))
		const min =  Math.min.apply(Math, this.children.map(t => this.getSize(t)))

		const s = this.getTotalArea();
		const ww = w*w;
		const ss = s*s;
		const ratio1 = ww/ss;
		return Math.max(ratio1*max, 1/(ratio1*min))
	}

	squarify(){

		if(this.children.length == 0)
			return;

		console.log(this.width, this.height)
		const c = this.children[0]
		if(this.width >= this.height) // horizontal subdivision
		{
			console.log("Going horizontally", this.xoffset, this.yoffset);
			const w1 = this.getSize(c)*this.width/this.getTotalArea();
			const ratio = this.height/w1;
			const currentRatio = this.getCurrentRatio(this.width)

			if(ratio <= currentRatio){
				c.relativeLocation.x = this.xoffset
				c.relativeLocation.y = this.yoffset
				
				c.width = w1;
				c.height = this.height;
				this.xoffset += w1;

				this.placed.push(c)
				this.children.shift()

				this.width = this.width - w1;
				this.squarify()
			}

		}
		else{ // vertical subdivision
			const w1 = this.getSize(c)*this.height/this.getTotalArea();
			const ratio = this.width/w1;
			const currentRatio = this.getCurrentRatio(this.height)

			console.log("Going vertical", this.xoffset, this.yoffset);
			if(ratio <= currentRatio){	
				c.relativeLocation.y = this.yoffset
				c.relativeLocation.x = this.xoffset
			
				this.yoffset += w1;
				c.height = w1;
				c.width = this.width;
				this.placed.push(c)
				this.children.shift()

				this.height = this.height - w1;
				this.squarify()
			}
		}
	}


}