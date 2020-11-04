/*global chrome*/
import * as React from "react";
import WasmBinary from './wasm-binary'
import Frame, { FrameContextConsumer }from 'react-frame-component';
import {RetrieverMockService} from '../services/retriever.mock.service'
import WASMListener from "models/wasm.listener";

export interface MainProps {
	binaries: WASMListener[];
}

export interface MainState extends MainProps {
	opened: boolean;
}
export default class Main extends React.Component<MainProps, MainState> {

	constructor(props: MainProps){
		super(props);

		this.state = {
			opened: false,
			binaries: props.binaries
		}

	}

	componentDidMount(){
		console.log("Setting callbacks...");
		const self = this;

		(window as any).setBinaries = function(wasm: WASMListener){
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
						<h2>WAKOKO</h2>
						<ul>
						{ 
							this.state.binaries &&
							this.state.binaries.map((t: any, i: number) => <li key={i}><WasmBinary freq={500} index={i} module={t} page={window.location.href}/></li>)
						}
						</ul>
				  </div>)}
				  }
			</FrameContextConsumer>
			</Frame>) 
		
		
    }
}

