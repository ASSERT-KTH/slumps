import * as React from "react";
import * as d3 from 'd3';
import GraphView from "./graph.view";
import {Node} from "../models/wasm.listener";

interface IProps{
    cfg: {
		[key: number]: Node
	};
}

interface IState {
    nodes?: any[];
    links?: any[];
    scale: number;
    rotation: number;

    width: number;
    height: number;
    dx: number;
    dy: number;

    processing: boolean;
}
export default class GraphData extends React.Component<IProps, IState> {
    
    constructor(props: IProps){
        super(props);

        this.state = {
            nodes: [],
            links: [],
            scale: 1,
            width: 500,
            height: 900,
            rotation: 0,
            dx: 0,
            dy: 0,
            processing: false
        }
    }
    
    componentWillReceiveProps(nextProps: IProps) {

        const nodes = Object.keys(nextProps.cfg).map(i => ({
            name: `${i}`,
            id: parseInt(i)
        }));
        const links = [].concat.apply([], nodes.map(n => {
            return Object.keys(nextProps.cfg[n.id].children).filter(t => nextProps.cfg[t]).map(ch => {
                return {
                    target: parseInt(ch),
                    source: n.id,
                    type: "CFG"
                }
            })
        }))


        this.setState({
            nodes,
            links
        })
        // TODO create graph
    }
    render(){

        if (!this.state.nodes || !this.state.links)
            return null;

        return (<GraphView
            opened={true}
            scale={this.state.scale}
            rotation={this.state.rotation}
            dx={this.state.dx}
            dy={this.state.dy}
            style={{
                marginTop: '20px'
            }}
            width={this.state.width}
            height={this.state.height}
            nodes={this.state.nodes}
            links={this.state.links} />);
    }
}
