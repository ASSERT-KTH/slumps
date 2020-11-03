/*global chrome*/
import * as React from "react";
import WasmBinary from './wasm-binary'
import Frame, { FrameContextConsumer }from 'react-frame-component';

export default class Main extends React.Component<any, any> {

	constructor(props: any){
		super(props);

		this.state = {
			opened: false,
			binaries: props.wasms
		}

	}

	componentDidMount(){
		console.log("Setting callbacks...");
		const self = this;

		(window as any).setBinaries = function(wasm: any){
			self.setState({binaries: [...self.state.binaries, wasm]})
		}.bind(this)

	}



    render() {
		
		return (<Frame head={[<link type="text/css" rel="stylesheet" href={
			/*@ts-ignore*/
			window.cssStyleAddress} ></link>]}> 
			<FrameContextConsumer>
				{
				({document, window}) => {
                      // Render Children
                      return (this.state.binaries && this.state.binaries.length > 0  &&  <div className={'wakoko-extension'}>
						<h2>This page uses WebAssembly!</h2>
						<ul>
						{ 
							this.state.binaries &&
							this.state.binaries.map((t: any, i: number) => <li key={i}><WasmBinary index={i} binary={t} name={window.location.href}/></li>)
						}
						</ul>
				  </div>)}
				  }
			</FrameContextConsumer>
			</Frame>) 
		
		
    }
}

