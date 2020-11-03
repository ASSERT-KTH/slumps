/*global chrome*/
/* src/content.js */

// @ts-ignore
const id = chrome.runtime.id;



var scriptElement = document.createElement("script");

// @ts-ignore
scriptElement.setAttribute('src', chrome.runtime.getURL('/static/js/app.js'));
scriptElement.async = false;   

var script = document.createElement('script');
script.innerText = `WRAPPER`;
// @ts-ignore
//script.setAttribute('src', chrome.runtime.getURL('/static/js/wrapper.js'));

var metaScript = document.createElement("script");
metaScript.async = false;
metaScript.innerText = `window.cssStyleAddress = "${
// @ts-ignore
chrome.runtime.getURL('/static/css/content.css')}"`;


(document.head||document.documentElement).prepend(scriptElement);
(document.head||document.documentElement).prepend(script);
(document.head||document.documentElement).prepend(metaScript);
// TODO check for service workers