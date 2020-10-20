const AnyProxy = require('anyproxy');
const fs = require("fs");

const MASKED_URL="https://wafl.live"

console.log(MASKED_URL)
const options = {
  port: 8080,
  throttle: 10000,
  forceProxyHttps: true,
  dangerouslyIgnoreUnauthorized: true,
  wsIntercept: false,
  silent: false,
  webInterface: {
    enable: true,
    webPort: 8002
  },
  rule: {
	
	beforeSendRequest: async function(requestDetail) {
		if(requestDetail.url.indexOf(MASKED_URL) !== -1){
			const wrapper_script = requestDetail.url.replace(MASKED_URL, "")
			console.log("Internal processing",wrapper_script)
			if(wrapper_script.indexOf("/static") !== -1){ // return static content
				const script_file = wrapper_script.replace("/static", "")
				console.log("Loading script content",script_file)
				const content = fs.readFileSync(`./static/${script_file}`);
				return {
					response: {
						statusCode: 200,
						header: { 'content-type': 'text/javascript' },
						body: content
					  }
				}
			}

			return {
				response: {
					statusCode: 400,
					header: { 'content-type': 'text/html' },
					body: "Not found"
				  }
			}
		}

	},
	beforeSendResponse: async function (requestDetail, responseDetail) {

		if(responseDetail.response.statusCode !== 200)
			return
		if(responseDetail.response.header["Content-Type"]){
			if(responseDetail.response.header["Content-Type"].indexOf("text/html") === -1) // Instrument only html responses
				return
		}

		// INJECT WAFL script
		let data = responseDetail.response.body.toString();
		const routerJS  = `<script type="text/javascript">window.INSTRUMENTER_HOST='${MASKED_URL}'</script>\n`

		const content = fs.readFileSync(`./static/${process.env.INSTRUMENTATION_TYPE}`);
		const dashboardIndex = fs.readFileSync(`./static/index.js`);

		const instrumentationJS = `<script type="text/javascript">${content}</script>\n`
		const dashBoardJS = `<script type="text/javascript">${dashboardIndex}</script>\n`
		data = data.replace("<head>", `<head>${routerJS}${instrumentationJS}\n`)

		if(data.indexOf("</body>") > -1)
			data = data.replace("</body>", `\n${dashBoardJS}\n</body>\n`)
		if(data.indexOf("<body>") > -1)
			data = data.replace("<body>", `<body>\n${dashBoardJS}\n`)

		console.log(data)
		
		if(data.indexOf("</head>") > -1)
			console.log(data.indexOf("</head>"))

		const newResponse = responseDetail.response;
		newResponse.body = Buffer.from(data, 'utf-8')
		
		// SET the security policy of the site
		newResponse.header = {...newResponse.header, 'content-security-policy':  "script-src * 'unsafe-inline' 'unsafe-eval';		"}

		return new Promise((resolve, reject) => {
			resolve({ response: newResponse });
		});
		//	}
		//}
			
		
	}
  }
};
const proxyServer = new AnyProxy.ProxyServer(options);

proxyServer.on('ready', () => { /* */ });
proxyServer.on('error', (e) => { console.log(e) });
proxyServer.start();

//when finished
//proxyServer.close();

/*
 */