
import * as React from "react";

class WasmBinary extends React.Component<any, any> {

	constructor(props: any){
	  super(props);
  
	  this.download = this.download.bind(this)
	}
  
	  download(){
		  
	  var atag = document.createElement("a");
	  var file = new Blob([this.props.binary],
		{type: "application/octet-stream"});
	  atag.href = URL.createObjectURL(file);
	  atag.download = `${this.props.name}${this.props.index}.wasm`;
	  atag.click();
	  atag.remove();
	}
	
	render(){
	  return <a style={{cursor: 'pointer'}} onClick={() => this.download()}>Download binary</a>
	}
  }

  export default WasmBinary;