import * as React from "react";
import * as d3 from 'd3';

interface IProps{
    nodes: any[];
    links: any[];
    style?: React.CSSProperties;
    scale?: number;
    rotation?: number;

    dx?: number;
    dy?: number;

    width: number;
	height: number;
	opened: boolean;
}

export default class GraphView extends React.Component<IProps, any> {
	//linkPath = d3.linkRadial().angle( (d: any) => d.x ).radius((d: any) => d.y);
    //nodePosition = (d) => `translate(${d3.pointRadial(d.x, d.y)})`;
    svg: any;

    c: any;

    updateStyleAndAttrs(nodes: any, links: any) {
        const cx = this.props.width/2;
        const cy = this.props.height/2;

        const dx = this.props.dx || 0;
        const dy = this.props.dy || 0;
		
		var items = d3.select(this.c).selectAll('*').remove();

		// Remove old elements:
		items.exit().remove();

		const link = d3.select(this.c).append("g")
		  .attr("stroke", "#999")
		  .attr("stroke-opacity", 0.6)
		.selectAll("line")
		.data(links)
		.join("line")
		  //.attr("stroke-width", d => Math.sqrt(d.value));
	
	  const node = d3.select(this.c).append("g")
		.attr("stroke", "#fff")
		.attr("stroke-width", 1.5)
		.selectAll("circle")
		.data(nodes)
		.join("circle")
		.attr("r", 3)
		.attr("fill", 'red');

        link.append("title")
			.text(function (d: any) {return d.type;});
		


		//console.log(node, links)
		const simulation = 
		d3.forceSimulation(nodes)
		.force("charge", d3.forceManyBody())
		.force("center", d3.forceCenter(cx, cy))
		// @ts-ignore
		.force("link", d3.forceLink(links).id(d => d.id));

		//console.log(nodes)

		simulation
            .on("tick", ticked);

		function ticked() {
			link
				.attr("x1", function (d: any) {return d.source.x;})
				.attr("y1", function (d: any) {return d.source.y;})
				.attr("x2", function (d: any) {return d.target.x;})
				.attr("y2", function (d: any) {return d.target.y;});
	
			node
			// @ts-ignore
				.attr("cx", d => d.x)
				// @ts-ignore
				.attr("cy", d => d.y);
	
		}

      }

    componentDidMount() {
        this.updateStyleAndAttrs(this.props.nodes, this.props.links)
    }
    
    componentDidUpdate() {
        this.updateStyleAndAttrs(this.props.nodes, this.props.links)
	}
	componentWillReceiveProps(nextProps: IProps){
       // this.updateStyleAndAttrs(this.props.nodes, this.props.links)
	}

    render(){


        return (
        <React.Fragment>
            <svg style={this.props.style} 
            className='canvas' 
            width={this.props.width}
            ref={e => this.c = e}>
                
            </svg>
        </React.Fragment>    );
    }
}
