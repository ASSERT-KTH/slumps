
import WASMListener from "models/wasm.listener";
import * as React from "react";
import CovPlot from "./plot";

export interface WasmBinaryProps {
	module: WASMListener;
	page: string;
	index: number;
}

export interface WasmBinaryState {
	history: number[]
}

class WasmBinary extends React.Component<WasmBinaryProps, WasmBinaryState> {

	constructor(props: WasmBinaryProps){
	  super(props);
		
	  this.state = {
		  history: []
	  }
	  this.download = this.download.bind(this)
	}
  
	time: any;

	componentDidMount(){
		this.time = setInterval(() => {
			this.props.module.getCoverage(true)
			this.setState({
				history: [...this.props.module.history]
			})
		}, 1000)
	}

	componentWillUnmount(){
		if(this.time)
			clearInterval(this.time)
	}

   download(){
		  
	  var atag = document.createElement("a");
	  var file = new Blob([this.props.module.original],
		{type: "application/octet-stream"});
	  atag.href = URL.createObjectURL(file);
	  atag.download = `${this.props.page}${this.props.index}.wasm`;
	  atag.click();
	  atag.remove();
	}


	downloadInstrumented(){
		  
		var atag = document.createElement("a");
		var file = new Blob([new Uint8Array(this.props.module.instrumented)],
		  {type: "application/octet-stream"});
		atag.href = URL.createObjectURL(file);
		atag.download = `${this.props.page}${this.props.index}.instrumented.wasm`;
		atag.click();
		atag.remove();
	  }
	
	render(){

		const lastVisited = this.state.history.slice(-1)[0] 
	  return (<div style={{padding: '5px'}}>
					<h4 style={{cursor: 'pointer'}} onClick={() => this.download()}>Download original binary</h4>

	  				<h4 style={{cursor: 'pointer'}} onClick={() => this.downloadInstrumented()}>Download instrumented binary</h4>

					  <h4>{lastVisited}/{this.props.module.totalBlocks} ({100.0*lastVisited/this.props.module.totalBlocks}%) </h4>

					<CovPlot values={this.state.history.map(t => 1.0*t/this.props.module.totalBlocks)} opened={true}/>

	  	</div>)
	}
  }

  export default WasmBinary;