
import React from 'react';
import ReactDOM from 'react-dom';
import "./content.css";
// // head={[<link type="text/css" rel="stylesheet" href={"http://localhost:5000/static/content.css"} ></link>]}> 

export class WASMStatusView extends React.Component {
	render(){
		return (
			<div style={{padding: 5, color: 'red'}}>
				{this.props.name} <a>{this.props.hash}</a> <a>Covered: {this.props.visited} ({100.0*this.props.visited/this.props.total}%), Basic blocks: {this.props.total} ({100.0*this.props.total/this.props.instructions}%), Instruction count: {this.props.instructions} </a>|
			</div>
		)
	}
}

export default class Main extends React.Component {

	constructor(){
		super()

		this.state = {
			opened: false,
			binaries: []
		}

		const self = this;
		console.log("Setting callbacks...")
		window.setBinaries = function(bins){
			self.setState({binaries: bins})
		}
	}

    render() {

		let style={
			position:'absolute',
			width:'100%',
			background: 'black',
			left: 0,
			zIndex: 999999,
			top: 0,
			backgroundColor: 'rgba(100,100,100,0.4)',
			fontSize: '9pt',
			fontFamily: "Consolas, Menlo, Monaco, Lucida Console, Liberation Mono, DejaVu Sans Mono, Bitstream Vera Sans Mono, Courier New, monospace, serif"

		}
        return (
			<div className={'my-extension'} style={style}>
				<div style={{display:'flex', flexFlow:'row', alignItems: 'center'}}>
					<h4 style={{padding: '5px', margin:0, color:'red'}}>
					Take a WAFL! | </h4>
					<div style={{display:'flex', flexDirection: 'column', flexFlow:'row'}}>
						{
							this.state.binaries.map(t => <WASMStatusView name={t.name} hash={t.hash} visited={t.uniqueHitBlocks} total={t.totalBlockCount} instructions={t.totalInstructions}/>)

						}
					</div>
					
				</div>
			</div>
        )
    }
}
