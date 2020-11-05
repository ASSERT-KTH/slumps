import * as React from "react";
import Squarifyier from "services/treemap.squarifier";
import Node from '../models/node';

interface IProps{
    children: Node[];
}

export default class TreeMap extends React.Component<IProps, any> {
	
    canvasRef: any;

	constructor(props){
		super(props);
		this.state = {
			size:60
		}

		this.draw = this.draw.bind(this)

	}
	
	draw(children: Node[]){

		function draw(n: Node, ctx){			
			ctx.fillStyle = '#00FF0066'

			console.log(n);
			ctx.fillRect(n.relativeLocation.x, n.relativeLocation.y, n.width, n.height);
			ctx.strokeStyle = "#FFFFFF";

			ctx.beginPath();
			ctx.rect(n.relativeLocation.x, n.relativeLocation.y, n.width, n.height);

			ctx.stroke();

			if(n.children.length > 0)
				for(let ch of n.children)
					draw(ch, ctx);
		}

		if(this.canvasRef){
			const canvas = this.canvasRef
			const context = canvas.getContext('2d')
			  

			context.fillStyle = '#000000'
			context.fillRect(0, 0, context.canvas.width, context.canvas.height)
			context.strokeStyle = "#FF0000";
			context.lineWidth = 4;

			for(let node of children)
				draw(node, context)

			
		}
	}

	componentDidMount(){

		const squarifier = new Squarifyier(0 ,0, 120, 60, this.props.children)
		squarifier.squarify()
		console.log(squarifier.placed)
		this.draw(squarifier.placed)
	}

	componentDidUpdate(){

	}
    render(){

        
		

        return (<canvas style={{height: this.state.size, width: 2*this.state.size}} ref={(r) =>this.canvasRef = r}/>)
		;
    }
}
