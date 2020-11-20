# WAKOKO Extension

## Project content

``` bash
\ src
  \ components
	#React components
  \ instrumentor
	- insite.based.instrumentor.ts
	- server.based.instrumentor.ts
  \ models
	- wasm.listener.ts
  \ services
	# Error, log, fuzz and treemap layout calculation, etc. All the service implementations

   - index.tsx # develop mode and ReactJS application entry point
   - wrapper.ts # WebAssembly API replacement code
   - content_template.js # template JS file, this file will generate the content.js file inside the extension folder structure.
```

## Contribute

To add new functionalities, make sure to add the new code in the corresponding folder. UI source code in `components`, new services in the `services` folder and so on. Take into account that we are following a component, object oriented approach for the services. Since we are using `TS`, try to follow "correct" guidelines for static typing, annotate the parameters of the functions with the correct type and try to avoid the `any` type. Use a correct naming strategy, meaningfull and not lazy.


## Overview

WAKOKO replaces the WebAssembly builtin API in the browser. As an extension, the content script is executed before the page is loaded into the browser (see public/manifest.json file). The content script adds a `script` tag in the top of the `head` element. The content of the injected script tag is the `wrapper.tsx` (compiled to JS) script.

The dashboard UI is injected separately as another `script` tag. The dashboard and the wrapper are implemented as two different entrypoints, which means that the application can be opened in develop mode with all the benefits of implementing a `react-app` with webpack. To run the dashboard for dev reasons, run `npm start` in this root folder.

## Instrumentor

Inside the wrapper code, there is a call to the instrumentation service. Right now, it is hardcoded to use the insite service. To change it to the server based approach, change the returning value in the following [script](src/instrumentor/instrumentor.ts).

## Building and packaging the extension

We need to follow some guidelines to build a browser extension. The content of the `public` folder will be copied in the build folder. For example, we placed the `manifest.json` file, which contains the basic behavior of the extension, in this folder. Besides, icons and images should be included here.

To build the extension run the following script, `bash build_extension.sh`. This script is a full pipeline, it first builds the `wakoko_instrumentor` project to WebAssembly using emcc (make sure to have [emsdk ](https://emscripten.org/) activated). Then the `content_template.js` file is filled with th needed contents, the browser extension address for the static files, and the wrapper code to be injected in the page. Concretely, thre are two reserved places where the code is added, `INSTRUMENTOR` and `WRAPPER`.

Notice if that the emsdk is not set, the build can fail. If this happens, change the default instrumentor to the server based approach as it is described previously.