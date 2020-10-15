const AnyProxy = require('anyproxy');
const options = {
  port: 8080,
  throttle: 10000,
  forceProxyHttps: true,
  dangerouslyIgnoreUnauthorized: true,
  wsIntercept: false,
  silent: false,
  rule: {
	beforeSendResponse: async function (requestDetail, responseDetail) {
		//console.log(responseDetail.response.header)
			//console.log(responseDetail.response.header)
			
		// INJECT WAFL script
		let data = responseDetail.response.body.toString();
		data = data.replace("<head>", '<head>\n<script src="http://localhost:5000/static/wrapper.js" defer></script>\n')
		console.log(data.indexOf("</head>"))
		const newResponse = responseDetail.response;
		newResponse.body = Buffer.from(data, 'utf-8')
		// SET the security policy of the site
		newResponse.header = {...newResponse.header, 'content-security-policy':  "script-src * 'unsafe-inline' 'unsafe-eval';		"}

		return new Promise((resolve, reject) => {
			resolve({ response: newResponse });
		});
			
		
	}
  }
};
const proxyServer = new AnyProxy.ProxyServer(options);

proxyServer.on('ready', () => { /* */ });
proxyServer.on('error', (e) => { /* */ });
proxyServer.start();

//when finished
//proxyServer.close();