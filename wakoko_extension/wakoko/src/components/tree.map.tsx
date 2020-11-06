import * as React from "react";
import Squarifyier from "services/treemap.squarifier";
import Node from '../models/node';

interface IProps{
    blockCount: number;
}

export default class TreeMap extends React.Component<IProps, any> {
	
    canvasRef: any;

	constructor(props){
		super(props);
		this.state = {
			size:400
		}

		this.draw = this.draw.bind(this)

	}
	
	draw(){


		if(this.canvasRef){



			const canvas = this.canvasRef
			const context = canvas.getContext('2d')

			const area = context.canvas.width*context.canvas.height;


			let ch = [
				{size: 6},
				{size: 6},
				{size: 4},
				{size: 3},
				{size: 2},
				{size: 2},
				{size: 1},
			];

			const s = ch.map(t => t.size).reduce((p, t) => p + t)

			const multiplier = area/s;

			const sq = new Squarifyier(context.canvas.width, context.canvas.height)
			
			console.log(multiplier)
			ch = ch.map(t => (
				{size: t.size*multiplier}
			))

			sq.squarify(ch, [], sq.w)
			console.log(ch)
			  

			context.fillStyle = '#0000ff'
			//context.fillRect(0, 0, context.canvas.width, context.canvas.height)
			context.strokeStyle = "#000000";
			context.lineWidth = 3;

			context.beginPath();
			
			let x = 0;
			let y = 0;
			let step = 2;

			for(let c of ch)
			{
				context.rect(c["x"], c["y"],c["width"], c["height"]);
			}
			context.stroke();

			
		}
	}

	componentDidMount(){

		this.draw()
	}

	componentDidUpdate(){
		this.draw()
	}
    render(){

        
		

        return (<canvas height={400} width={600} ref={(r) =>this.canvasRef = r}/>)
		;
    }
}
