/*global chrome*/
/* src/content.js */
import "./content.css";

// @ts-ignore
const id = chrome.runtime.id;



var scriptElement = document.createElement("script");

// @ts-ignore
scriptElement.setAttribute('src', chrome.runtime.getURL('/static/js/app.js'));
scriptElement.async = false;   

var script = document.createElement('script');
// @ts-ignore
//script.setAttribute('src', chrome.runtime.getURL('/static/js/wrapper.js'));


chrome.runtime.getPackageDirectoryEntry(function(root) {
	root.getFile("wrapper.js", {}, function(fileEntry) {
		script.async = false;   
		script.innerText = 
	  fileEntry.file(function(file) {
		var reader = new FileReader();
		reader.onloadend = function(e) {
		  // contents are in this.result
		};
		reader.readAsText(file);
	  }, errorHandler);
	}, errorHandler);
  });

var metaScript = document.createElement("script");
metaScript.async = false;
metaScript.innerText = `window.cssStyleAddress = "${
	// @ts-ignore
	chrome.runtime.getURL('/static/css/content.css')}"`;


(document.head||document.documentElement).prepend(scriptElement);
(document.documentElement).prepend(script);
(document.head||document.documentElement).prepend(metaScript);

// TODO check for service workers