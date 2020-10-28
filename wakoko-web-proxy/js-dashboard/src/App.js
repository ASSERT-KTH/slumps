
import React from 'react';
import ReactDOM from 'react-dom';
import "./content.css";
// // head={[<link type="text/css" rel="stylesheet" href={"http://localhost:5000/static/content.css"} ></link>]}> 

export class CovPlot extends React.Component {

	canvasRef;

	constructor(){
		super();
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

export class WASMStatusView extends React.Component {

	constructor(){
		super();

		this.state = {
			opened: false
		}

		this.download = this.download.bind(this);
	}

	download(){
		
		if(this.props.visited){
			var atag = document.createElement("a");
			var file = new Blob([this.props.visited.reduce((p, c) => `${p},${c}`)],
					{ type: "text/plain;charset=utf-8" });
			atag.href = URL.createObjectURL(file);
			atag.download = "cov.csv";
			atag.click();
		}

	}

	render(){
		let lastVisited = this.props.visited.slice(-1)[0] 

		return (<div key={this.props.name} onMouseLeave={() => this.setState({opened: false})} onMouseOver={() => this.setState({opened: true})} style={{paddingRight: 5, color: 'white', fontSize: '7pt'}}>
				<a   > {lastVisited}/{this.props.total} ({100.0*lastVisited/this.props.total}%) </a><a onClick={this.download}>Download data</a>
				<CovPlot values={this.props.visited.map(t => 1.0*t/this.props.total)} opened={true}/>
			</div>)
	}
}


export default class Main extends React.Component {

	constructor(){
		super()

		this.state = {
			opened: true,
			// visited={t.uniqueHitBlocks} total={t.totalBlockCount} instructions={t.totalInstructions}
			rate: 5000,
			binaries: [
				/*{
					name: '1',
					uniqueHitBlocks: [1,1,1,1,1,1,2,3],
					totalBlockCount: 3,
					totalInstructions: 10
				},
				{
					name: '2',
					uniqueHitBlocks: [1,2,3, 100, 120, 120, 130, 150, 200, 240, 245, 260, 300, 323],
					totalBlockCount: 323,
					totalInstructions: 10
				}*/
			]
		}

		const self = this;
		
		
	}

	componentDidMount(){
		console.log("Setting callbacks...")

		window.setBinaries = function(wasms){
			this.setState({binaries: wasms})
		}.bind(this)
		/*
		setInterval(function(){
			console.log("Retrieving listeners...")
			
			window.wasms = function(w){
				
				this.setState({binaries: [...window.rawWasms], opened: false})
				console.log(this.state.binaries)
			}
			this.setState({binares: [...window.rawWasms]})
		
		}.bind(this), 10000)*/
	}

    render() {

		let style={
			position:'fixed',
			width:'100%',
			background: 'black',
			left: 0,
			zIndex: 999999,
			top: 0,
			backgroundColor: 'rgba(0,0,0,1)',
			fontSize: '9pt',
			boxShadow: '2px 2px 2px grey',
			fontFamily: "Consolas, Menlo, Monaco, Lucida Console, Liberation Mono, DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace, serif"

		}
        return (
			<div>
			{this.state.opened && <div style={style}>
				<div style={{display:'flex', flexFlow:'row', alignItems: 'center'}}>
					<h4 style={{padding: '5px', margin:0, color:'white', cursor:'pointer'}} onClick={() => this.setState({opened: !this.state.opened})}>
					WAKOKO</h4>
					
				</div>
				<div style={{display:'flex', flexDirection: 'column', flexFlow:'row', paddingBottom: '2px', paddingLeft: '4px'}}>
					{
						this.state.binaries.map(t => <WASMStatusView name={t.name} hash={t.hash} visited={t.uniqueHitBlocks} total={t.totalBlockCount} instructions={t.totalInstructions}/>)

					}
				</div>
					
			</div>}
			{!this.state.opened && <a style={{...style,color:'white', backgroundColor:'black', width:'auto', cursor:'pointer', padding:'2px'}} onClick={() => this.setState({opened: !this.state.opened})}>WAKOKO</a>}
			</div>
        )
    }
}
