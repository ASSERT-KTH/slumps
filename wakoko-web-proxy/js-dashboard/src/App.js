
import { Cursor } from 'mongodb';
import React from 'react';
import ReactDOM from 'react-dom';
import "./content.css";
// // head={[<link type="text/css" rel="stylesheet" href={"http://localhost:5000/static/content.css"} ></link>]}> 

export class WASMStatusView extends React.Component {
	render(){
		return (
			<div style={{paddingRight: 5, color: 'white', fontSize: '7pt'}}>
				<a> {this.props.visited}/{this.props.total} ({100.0*this.props.visited/this.props.total}%) </a>|
			</div>
		)
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
					uniqueHitBlocks: 1,
					totalBlockCount: 3,
					totalInstructions: 10
				},
				{
					name: '1',
					uniqueHitBlocks: 2,
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
