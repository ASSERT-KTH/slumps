import * as React from "react";
import * as d3 from 'd3';
import GraphView from "./graph.view";
import {Node} from "../models/wasm.listener";

interface IProps{
    nodes: {
		[key: number]: boolean
	}
	links: {
		target: number,
		source: number
	}[] 
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
            width: 300,
            height: 500,
            rotation: 0,
            dx: 0,
            dy: 0,
            processing: false
        }
    }
    
    componentWillReceiveProps(nextProps: IProps) {

        this.setState({
            nodes: Object.keys(nextProps.nodes).map(t => ({
                id: t,
                name: `${t}`
            })),
            links: nextProps.links
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

            }}
            width={this.state.width}
            height={this.state.height}
            nodes={this.state.nodes}
            links={this.state.links} />);
    }
}
