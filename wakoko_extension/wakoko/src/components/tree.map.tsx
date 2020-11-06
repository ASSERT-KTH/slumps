import * as React from "react";
import Squarifyier from "services/treemap.squarifier";
import Node from '../models/node';

interface IProps{
    blockCount: number;
}

export default class TreeMap extends React.Component<IProps, any> {
	
    canvasRef: any;

	constructor(props){
		super(props);
		this.state = {
			size:400
		}

		this.draw = this.draw.bind(this)

	}
	
	draw(){


		if(this.canvasRef){



			const canvas = this.canvasRef
			const context = canvas.getContext('2d')

			const area = context.canvas.width*context.canvas.height;


			let ch = [ {
      
				"size" : 8,
				hit: 1
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 24
			  }, {
				
				"size" : 22
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 18
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 86
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 30
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 16
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 12
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 75
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 22
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 57
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 19
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 30
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 15
			  }, {
				
				"size" : 65
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 27
			  }, {
				
				"size" : 20
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 31
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 23
			  }, {
				
				"size" : 18
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 12
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 16
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 20
			  }, {
				
				"size" : 24
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 42
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 50
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 54
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 18
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 23
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 15
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 18
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 57
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 18
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 21
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 98
			  }, {
				
				"size" : 16
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 21
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 57
			  }, {
				
				"size" : 16
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 16
			  }, {
				
				"size" : 18
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 21
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 17
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 19
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 31
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 11
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 20
			  }, {
				
				"size" : 17
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 57
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 18
			  }, {
				
				"size" : 9
			  }, {
				
				"size" : 21
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 17
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 13
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 14
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 7
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 2
			  }, {
				
				"size" : 5
			  }, {
				
				"size" : 20
			  }, {
				
				"size" : 17
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 16
			  }, {
				
				"size" : 8
			  }, {
				
				"size" : 10
			  }, {
				
				"size" : 3
			  }, {
				
				"size" : 12
			  }, {
				
				"size" : 6
			  }, {
				
				"size" : 4
			  }, {
				
				"size" : 1
			  } ];

			  /*ch = [
				  {size: 6},
				  {size: 6},
				  {size: 4},
				  {size: 3},
				  {size: 2},
				  {size: 2},
				  {size: 1},
			  ];*/

			ch  = ch.sort((a, b) => -1*a.size + b.size)
			const s = ch.map(t => t.size).reduce((p, t) => p + t)

			const multiplier = area/s;

			const sq = new Squarifyier(context.canvas.width, context.canvas.height)
			
			console.log(multiplier)
			ch = ch.map(t => (
				{size: t.size*multiplier, hit: t.hit}
			))

			sq.squarify(ch, [], sq.w)
			console.log(ch)
			  

			context.fillStyle = '#00ff00'
			//context.fillRect(0, 0, context.canvas.width, context.canvas.height)
			context.strokeStyle = "#000000";
			context.lineWidth = 0.2;

			context.beginPath();
			
			let x = 0;
			let y = 0;
			let step = 2;

			for(let c of ch)
			{
				context.rect(c["x"], c["y"],c["width"], c["height"]);
				
				if(c.hit)
					context.fillRect(c["x"], c["y"],c["width"], c["height"]);
			}
			context.stroke();

			
		}
	}

	componentDidMount(){

		this.draw()
	}

	componentDidUpdate(){
		this.draw()
	}
    render(){

        
		

        return (<canvas height={400} width={600} ref={(r) =>this.canvasRef = r}/>)
		;
    }
}
