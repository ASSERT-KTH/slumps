import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';


class WasmBinary extends React.Component {

  constructor(){
    super();

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

class Main extends React.Component {

	constructor(props){
		super(props);

		this.state = {
			opened: false,
			binaries: props.wasms
		}

	}

	componentDidMount(){
		console.log("Setting callbacks...")
		
		window.setBinaries = function(wasm){
			this.setState({binaries: [...this.state.binaries, wasm]})
		}.bind(this)

	}



    render() {
        return (
            <div className={'my-extension'}>
              { 
                this.state.binaries &&
                  this.state.binaries.map(t => <h2>This page uses WebAssembly!</h2>)
              }
              <ul>
              { 
                this.state.binaries &&
                  this.state.binaries.map((t, i) => <li key={i}><WasmBinary index={i} binary={t} name={window.location.href}/></li>)
              }
              </ul>
            </div>
        )
    }
}


const app = document.createElement('div');
app.id = "my-extension-root";
document.documentElement.appendChild(app);
ReactDOM.render(<Main wasms={window.wasms || []} />, app);
