import * as React from "react";

export default class CovPlot extends React.Component<{
	opened: boolean,
	values: number[]
}, any> {

	canvasRef;

	constructor(props){
		super(props);
		this.state = {
			size: 50
		}

		this.draw = this.draw.bind(this)

	}

	draw(){
		if(this.canvasRef){
			const canvas = this.canvasRef
			const context = canvas.getContext('2d')
			  

			context.fillStyle = '#000000'
			context.fillRect(0, 0, context.canvas.width, context.canvas.height)
			context.strokeStyle = "#00FF00";
			context.lineWidth = 6;

			context.beginPath();
			const xScale = context.canvas.width/(2*this.props.values.length);

			for(let i = 1; i < this.props.values.length; i++){

				const x0 = xScale*(2*(i - 1) + 1)
				const x1 = xScale*(2*(i) + 1)

				const y0 = context.canvas.height - 0.9*this.props.values[i - 1]*context.canvas.height
				const y1 = context.canvas.height - 0.9*this.props.values[i]*context.canvas.height

				context.moveTo(x0, y0);
				context.lineTo(x1, y1);
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

		return (
			this.props.opened && (<div style={{paddingRight: 5, color: 'white', fontSize: '7pt', top:'50px', height: this.state.size}}>
				<canvas style={{height:0.8*this.state.size}} ref={(r) =>this.canvasRef = r}/>
			</div>)
		)
	}
}
