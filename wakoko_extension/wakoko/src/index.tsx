
import * as React from "react";
import * as ReactDOM from 'react-dom';
import Main from 'components/app';
import './index.css';

// @ts-ignore
if(!window.IS_EXTENSION)
	// @ts-ignore
	window.DEBUG=true;

const app = document.createElement('div');
app.id = "wakoko-extension-root";
(document.body || document.documentElement).appendChild(app);
ReactDOM.render(<Main binaries={(window as any).wasms || []} />, app);
