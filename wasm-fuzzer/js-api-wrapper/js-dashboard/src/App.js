/*global chrome*/

import React from 'react';
import ReactDOM from 'react-dom';
import "./content.css";
import Frame, { FrameContextConsumer }from 'react-frame-component';

export default class Main extends React.Component {
    render() {
        return (<Frame head={[<link type="text/css" rel="stylesheet" href={chrome.runtime.getURL("/static/css/content.css")} ></link>]}> 
				<FrameContextConsumer>
				{
				// Callback is invoked with iframe's window and document instances
					({document, window}) => {
						// Render Children
						return (
						<div className={'my-extension'}>
							<h1>WAFL for Chrome</h1>
						</div>
						)
					}
				}
				</FrameContextConsumer>
			</Frame>
        )
    }
}
