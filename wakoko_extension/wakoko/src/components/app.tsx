/*global chrome*/
import * as React from "react";
import WasmBinary from './wasm-binary'
import Frame, { FrameContextConsumer }from 'react-frame-component';
import {RetrieverMockService} from '../services/retriever.mock.service'
import WASMListener from "models/wasm.listener";
import TreeMap from "./tree.map";
import { Progress, Card, InputNumber, Form, Row, Col, Switch, Input, Alert, Collapse } from 'antd';
import LocalStorageService from "services/local.storage.service";

const {Panel} = Collapse;

const mock = new RetrieverMockService()

export interface MainProps {
	binaries: WASMListener[];
}

export interface MainState extends MainProps {
	opened: boolean;
	savingUrl: string;
}
export default class Main extends React.Component<MainProps, MainState> {
	localService: LocalStorageService;

	constructor(props: MainProps){
		super(props);

		this.localService = new LocalStorageService()
	  
		this.state = {
			opened: !!props.binaries.length,
			binaries: ((window as any).PRODUCTION)? props.binaries : mock.createMockListeners(),
			savingUrl: this.localService.getSavingHost()
		}

	}

	componentDidMount(){
		console.log("Setting callbacks...");
		const self = this;

		(window as any).setBinaries = function(wasm: WASMListener){
			self.setState({binaries: [...self.state.binaries, wasm]})
		}.bind(this)

	}
	onChangeUrl = (e) => {
		this.setState({savingUrl: e.target.value})

		setTimeout(() => this.localService.setSavingUrl(this.state.savingUrl), 2*this.localService.timeout);
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
						return (<div className={'wakoko-extension'}>
							<Collapse defaultActiveKey={['0']} >
							<Panel key="1" header="General settings">
										
								<Alert type='warning' message="To change one of the following options will reload the page in a 2 seconds timeout" />		
									<Form>
										<Row gutter={24}>
											
											<Col span={24}>
											<Form.Item
											label="Number of block to bypass"
											help="Due to the current limitation on the number of globals, exports and function instructions we propose an strategy to bypass too close blocks. A value X greater than 0 means that the block needs to be at X instructions far from the previous instrumentation to be instrumented."
												>
													<InputNumber 
														value={this.localService.getNumberofBypassedBlocks()} 
														onChange={e => this.localService.setNumberofBypassedBlocks(e as number)}
													/>
												</Form.Item>
				
											</Col>
										</Row>
										<Row gutter={24}>
											
											<Col span={24}>
												<Form.Item
													label="Send info to"
													help="We will send the collected information to a server of your preference. The infor includes, coverage info, original binary, instrumented binary and Stats.js information. Refer to protocol documentation to implement your endpoints."
												>
													<Input 
													value={this.state.savingUrl} 
													onChange={this.onChangeUrl} placeholder={"https://"}/>
												</Form.Item>
				
											</Col>
										</Row>
										<Row gutter={24}>
				
											<Col span={12}>
													
													<Form.Item
													label="Inject Stats.js"
													help="We inject our version of Stats.js in the page."
												>
												<Switch checked={this.localService.isStatsInjected()} onChange={e => this.localService.toggleStatsInjection(e)} />
												</Form.Item>
											</Col>
											<Col span={12}>
												
													<Form.Item
													help="Use the Wasm compiled instrumentor. If it is not checked we will use the url set above to ask for the instrumented version. Refer to the protocol to implement the endpoint for instrumentation and which kind of information are we waiting from the request."
													label="Inline instrumentor"
												>
												<Switch disabled checked />
												</Form.Item>
											</Col>
											
										</Row>
										<Row gutter={24}>
										<Col span={12}>
												
												<Form.Item
													label="Collect all WASMs"
													help="Send the wasm binaries to the above set url"
												>
													<Switch disabled />
												</Form.Item>
				
											</Col>
										</Row>
									</Form>

						</Panel>
						</Collapse>
						{ this.state.binaries && this.state.binaries.length > 0  &&  
							this.state.binaries.map((t: any, i: number) => <WasmBinary key={i}  index={i} module={t} page={window.location.href}/>)
						}</div>)
					}
				} 
				</FrameContextConsumer>
			</Frame>}</React.Fragment>) 
		
		
    }
}

