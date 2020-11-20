/*global chrome*/
import * as React from "react";
import WasmBinary from './wasm-binary'
import Frame, { FrameContextConsumer }from 'react-frame-component';
import {RetrieverMockService} from '../services/retriever.mock.service'
import WASMListener from "models/wasm.listener";
import TreeMap from "./tree.map";


const mock = new RetrieverMockService()

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
			opened: !!props.binaries.length,
			binaries: ((window as any).DEBUG)? mock.createMockListeners() : props.binaries
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
		
		return (<React.Fragment>
				<a onClick={() => this.setState({opened: !this.state.opened})} style={{position:'fixed', top: 0, right: this.state.opened? 290 : 10, zIndex: 9999999}}><strong>{this.state.opened? '> wakoko': '< wakoko'}</strong></a>
				{this.state.opened && <Frame style={{background:'transparent'}} head={[
				<link type="text/css" rel="stylesheet" href={
				/*@ts-ignore*/
				`${window.staticAddress? window.staticAddress : ''}/css/content.css`} ></link>,
				<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/antd@4.8.0/dist/antd.css"></link>]}> 
				<FrameContextConsumer>
					{
					({document, window}) => {
						// Render Children
						return (this.state.binaries && this.state.binaries.length > 0  &&  <div className={'wakoko-extension'}>
							
						{ 
							this.state.binaries.map((t: any, i: number) => <WasmBinary key={i} freq={2000} index={i} module={t} page={window.location.href}/>)
						}</div>)
					}
				} 
				</FrameContextConsumer>
			</Frame>}</React.Fragment>) 
		
		
    }
}

