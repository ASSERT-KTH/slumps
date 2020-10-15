/* src/index.js */
import React from 'react';
import ReactDOM from 'react-dom';
import Main from "./App.js"

const app = document.createElement('div');
app.id = "my-extension-root";
document.body.appendChild(app);

ReactDOM.render(<Main />, app);


// Reinject the scripts