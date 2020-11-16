
import WASMListener, {BaseWASMListener} from "models/wasm.listener";
import * as React from "react";
import GraphData from "./graph.data";
import Graph from "./graph.view";
import CovPlot from "./plot";
import { Progress, Card } from 'antd';
import { DownloadOutlined, DownSquareFilled, BoxPlotOutlined } from '@ant-design/icons';
import TreeMap from "./tree.map";

export interface WasmBinaryProps {
	module: BaseWASMListener;
	page: string;
	index: number;
	freq: number;
}

export interface WasmBinaryState {
	history: number[],
	nodes: {
		[key: number]: boolean
	}
	links: {
		target: number,
		source: number
	}[],
	blockInfo: Uint8Array
}

class WasmBinary extends React.Component<WasmBinaryProps, WasmBinaryState> {

	constructor(props: WasmBinaryProps){
	  super(props);
		
	  this.state = {
		  history: [],
		  nodes: {},
		  links: [],
		  blockInfo: this.props.module.blockMap
	  }
	  this.download = this.download.bind(this)
	}
  
	time: any;

	componentDidMount(){
		this.time = setInterval(() => {
			this.props.module.getBlockCoverage(true)
			this.props.module.setVisitedMap(true)

			this.setState({
				history: [...this.props.module.history],
				blockInfo: this.props.module.blockMap
			})
		}, this.props.freq)
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

	downloadCSV(){
		
		if(this.state.history){
			var atag = document.createElement("a");
			// @ts-ignore
			var file = new Blob([this.state.history.reduce((p, c) => `${p},${c}`)],
					{ type: "text/plain;charset=utf-8" });
			atag.href = URL.createObjectURL(file);
			atag.download = "cov.csv";
			atag.click();
		}

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
		const percent = Number((100*lastVisited/this.props.module.totalBlocks).toFixed(2));
	  return (<Card 
	  cover={
	  <React.Fragment>
		  <CovPlot values={this.state.history.map(t => 1.0*t/this.props.module.totalBlocks)} opened={true}/>
		  {/*<TreeMap functions={this.props.module.meta.map} hitMap={this.props.module.blockMap} blockCount={this.props.module.totalBlocks}/>*/}
	</React.Fragment>}
	  actions={[
		<BoxPlotOutlined key="setting" title="Download time data" onClick={() => this.downloadCSV()} />,
		<DownloadOutlined key="edit" title="Download original binary" onClick={() => this.download()}/>,
		<DownSquareFilled key="ellipsis" title="Download instrumented binary" onClick={() => this.downloadInstrumented()}/>,
	  ]}
	  ><div style={{padding: '5px'}}>

					<Progress showInfo percent={percent} />


					
					{/*<GraphData links={this.state.links} nodes={this.state.nodes}/>*/}
		  </div></Card>)
	}
  }

  export default WasmBinary;