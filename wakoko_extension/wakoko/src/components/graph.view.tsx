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
		console.log(nodes, links);
        const cx = this.props.width/2;
        const cy = this.props.height/2;

        const dx = this.props.dx || 0;
        const dy = this.props.dy || 0;
		

	  const node = d3.select(this.c)
	  .selectAll(".node")
	  .data(nodes)
		

	  const link = d3.select(this.c)
	  .selectAll(".link")
	  .data(links)


	d3.select(this.c)
	.selectAll('.links')  
	.attr("transform", 
	`translate(${cx + dx}, ${cy + dy}) 
	scale(${this.props.scale || 1}, ${this.props.scale || 1} )
	rotate(${this.props.rotation||0})`)


	d3.select(this.c)
	.selectAll('.nodes')  
	.attr("transform", 
		`translate(${cx + dx}, ${cy + dy}) 
		scale(${this.props.scale || 1}, ${this.props.scale || 1})
		rotate(${this.props.rotation||0})`)

		//console.log(node, links)
	const simulation = 
		d3.forceSimulation(nodes)
		.force("charge", d3.forceManyBody())
		.force("center", d3.forceCenter(cx, cy))
		// @ts-ignore
		//.force("link", d3.forceLink(links).id(d => d.name));

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

        const nodes = this.props.nodes.map((i, index) => <circle r={2} className={`node node-${i.name}`} key={index + 'node'} />)
        const links = this.props.links.map((i, index) => <line className='link' key={index + 'path'} />)

        return (
        <React.Fragment>
            <svg style={this.props.style} 
            className='canvas' 
            width={this.props.width}
            height={this.props.height}
            ref={e => this.c = e}>
                <g className="links">
                    {links}
                </g>
                <g className="nodes">
                    {nodes}
                </g>
            </svg>
        </React.Fragment>    );
    }
}
