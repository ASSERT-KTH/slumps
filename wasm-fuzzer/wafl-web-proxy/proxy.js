const AnyProxy = require('anyproxy');

console.log(process.env.INSTRUMENTER_ADDRESS)
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
	beforeSendResponse: async function (requestDetail, responseDetail) {
		//console.log(responseDetail.response.header)
		
		

		if("Content-Type" in responseDetail.response.header) // DO NOT change WASM files
		{
			//console.log(responseDetail.response.header["Content-Type"])
			if(responseDetail.response.header["Content-Type"].indexOf("application/octet-stream") !== -1)
				return
		}
		// INJECT WAFL script
		let data = responseDetail.response.body.toString();
		const routerJS  = `<script type="text/javascript">window.INSTRUMENTER_HOST='${process.env.INSTRUMENTER_ADDRESS}'</script>\n`
		const instrumentationJS = `<script src="${process.env.INSTRUMENTER_ADDRESS}/static/${process.env.INSTRUMENTATION_TYPE}"></script>\n`
		data = data.replace("<head>", `<head>${routerJS}${instrumentationJS}\n`)
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