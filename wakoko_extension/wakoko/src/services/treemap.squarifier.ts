
import Node from '../models/node';

export default class Squarifyier{

	w: number;

	widthValue: number;
	heightValue: number;
	xoffset: number = 0;
	yoffset: number = 0;

	constructor(xoffset, yoffset, width, height){
		
		this.widthValue = width;
		this.heightValue = height;
		this.xoffset = xoffset;
		this.yoffset = yoffset;

		if(width >= height)
			this.w = height;
		else
			this.w = width
	}


	worst(row: {size: number}[], w: number){

		const min = Math.min.apply(Math, row.map(t => t.size))
		const max = Math.max.apply(Math, row.map(t => t.size))
		const s = row.map(t => t.size).reduce((p, t) => p + t)

		const ww = w*w;
		const ss = s*s;

		return Math.max(Math.pow(w, 2) * max / Math.pow(s, 2), Math.pow(s, 2) / (Math.pow(w, 2) * min));
	}

	squarify(children: { size: number }[], row: {size: number}[], w: number){


		if(children.length == 1){
			this.layoutRow([...row, children[0]])
			return;
		}

		const head = children[0];

		const newRow  = [...row, head]

		if(row.length == 0){
			this.squarify(children.slice(1), newRow, w);
			return
		}

		const worst1 = this.worst(row, w)
		const worst2 = this.worst(newRow, w)
		if(worst1 >= worst2)
			this.squarify(children.slice(1), newRow, w);
		else{
			this.layoutRow(row);
			this.squarify(children, [], this.w)
		}
	}

	layoutRow(row: { size: number }[]){

		const s = row.map(t => t.size).reduce((p, t) => p + t)


			
		const areaWidth = s/this.heightValue;
		const  areaHeight = s/this.widthValue;

		let newX = this.xoffset;
		let newY = this.yoffset;

		if(this.widthValue >= this.heightValue)
			for(let r of row){
				r['x'] = newX;
				r['y'] = newY;
				r['width'] = areaWidth;
				r['height'] = r.size/areaWidth;
				newY += r.size/areaWidth;
			}
		else
			for(let r of row){
				r['x'] = newX;
				r['y'] = newY;
				r['width'] = r.size/areaHeight;
				r['height'] = areaHeight;
				newX += r.size/areaHeight; 
			}


		let width = this.widthValue;
		let height = this.heightValue;

		if(this.widthValue >= this.heightValue)// in the left
		{
			const areaRatio = s/this.heightValue;
			width = width - areaRatio;

			this.widthValue = width;
			this.xoffset = this.xoffset + areaRatio;
		}
		else{
			const areaRatio = s/this.widthValue;
			height = height - areaRatio;

			this.heightValue = height;
			this.yoffset = this.yoffset + areaRatio;
		}



		if(this.widthValue >= this.heightValue)
			this.w = this.heightValue 
		else
			this.w = this.widthValue
	}


}