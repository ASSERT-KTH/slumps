import * as React from "react";
import Squarifyier from "services/treemap.squarifier";
import Node from '../models/node';

export interface BlockInfo {
	size: number;
}

interface IState{
	hitMap: Array<{x: number, y: number, width: number, height: number, hit: number}>

}

interface IProps{
	blockCount: number,
	functions: any[],
	hitMap: Uint8Array
}


export default class TreeMap extends React.Component<IProps, IState> {
	
    canvasRef: any;

	constructor(props){
		super(props);
		this.state = {
			hitMap: new Array(this.props.blockCount)
		}

		this.draw = this.draw.bind(this)

	}

	drawMap(){


		if(this.canvasRef){

			const canvas = this.canvasRef
			const context = canvas.getContext('2d')

			const area = context.canvas.width*context.canvas.height;


			let ch = this.props.functions;

			//ch  = ch.sort((a, b) => -1*a.size + b.size)
			const s = ch.map(t => t.size).reduce((p, t) => p + t)

			const multiplier = area/s;

			const sq = new Squarifyier(0, 0, context.canvas.width, context.canvas.height)
			
			ch = ch.map(t => (
				{...t,size: t.size*multiplier}
			))

			sq.squarify(ch, [], sq.w)
			  

			context.fillStyle = '#FFFFFF'
			context.fillRect(0, 0, context.canvas.width, context.canvas.height)
			context.strokeStyle = "#ff0000";
			context.lineWidth = 1;
			context.fillStyle = '#00ff00'

			context.beginPath();
			
			let x = 0;
			let y = 0;
			let step = 2;

			let hitMap = this.state.hitMap

			for(let c of ch)
			{
				context.rect(c["x"], c["y"],c["width"], c["height"]);
				
			}

			context.stroke();
			context.strokeStyle = "#000000";
			context.beginPath();
			context.lineWidth = 0.3;

			let sum = 0;
			for(let func of ch){
				if(func.children == 0)
					continue;
				const area = func.width*func.height;

	
				//ch  = ch.sort((a, b) => -1*a.size + b.size)
				const s = func.children.map(t => t.size).reduce((p, t) => p + t)
				
	
				const multiplier = area/s;
	
				const sq = new Squarifyier(func.x, func.y, func.width, func.height)
				
				let blocks = func.children.map(t => (
					{size: t.size*multiplier, id: t.id}
				))
	
				sq.squarify(blocks, [], sq.w)

				for(let b of blocks)
				{
					hitMap[b.id] = { x: b['x'], y: b['y'], width: b['width'], height: b['height'], hit: 0 };
					context.rect(b["x"], b["y"],b["width"], b["height"]);
					
				}
			}


			context.stroke();

			this.setState({hitMap: hitMap})
		}
	}
	
	draw(hitMap){
		const canvas = this.canvasRef
		const context = canvas.getContext('2d')

		context.fillStyle = '#00FF00'

		
		for(let i = 0; i < hitMap.length; i++){
			const b = hitMap[i];

			if(b && b.hit){
				context.fillRect(b.x, b.y, b.width, b.height)
			}
		}
	}

	componentDidMount(){

		this.drawMap()
	}

	componentWillReceiveProps(nextProps: IProps){
		
		const stateHitMap = this.state.hitMap
		for(let i = 0; i < nextProps.hitMap.length; i++)
			if(nextProps.hitMap[i] && nextProps.hitMap[i]){
				if(stateHitMap[i])
					stateHitMap[i].hit = 1
			}
		this.draw(stateHitMap)

	}
    render(){

        
		

        return (<canvas height={400} width={600} ref={(r) =>this.canvasRef = r}/>)
		;
    }
}
