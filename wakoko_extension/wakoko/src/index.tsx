
import * as React from "react";
import * as ReactDOM from 'react-dom';
import Main from 'wrapper/app';
import './index.css';

const app = document.createElement('div');
app.id = "my-extension-root";
document.documentElement.appendChild(app);
ReactDOM.render(<Main wasms={(window as any).wasms || []} />, app);
