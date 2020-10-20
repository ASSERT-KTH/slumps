const AnyProxy = require('anyproxy');
const fs = require("fs");
var MongoClient = require('mongodb').MongoClient;
const mongoUrl = process.env.MONGI_DB ||  "mongodb://localhost:27017/mydb";
const crypto = require('crypto');
const md5sum = crypto.createHash('md5');
var exec = require('child_process').execSync;

MongoClient.connect(mongoUrl, function(err, db) {
	if (err) throw err;

	var dbo = db.db("wafl");
	if(!dbo.collection("requests"))
		dbo.createCollection("requests", function(err, res) {
	if (err) throw err;
	
    console.log("Collection created!");
    db.close();
  });
});

const INSTRUMENT_URL = "https://wafl.live"
const MASKED_URL=/^https?:\/\/wafl.live/

console.log(MASKED_URL)
const options = {
  port: 8080,
  throttle: 10000,
  forceProxyHttps: true,
  dangerouslyIgnoreUnauthorized: true,
  wsIntercept: false,
  silent: false,
  webInterface: {
    enable: false
  },
  rule: {
	
	beforeSendRequest: async function(requestDetail) {
		if(MASKED_URL.test(requestDetail.url)){
			
			const wrapper_script = requestDetail.url.replace(MASKED_URL, "")
			console.log("Internal processing",wrapper_script)
			if(wrapper_script.indexOf("/static") !== -1){ // return static content
				const script_file = wrapper_script.replace("/static", "")
				console.log("Loading script content",script_file)
				const content = fs.readFileSync(`./static/${script_file}`);
				return {
					response: {
						statusCode: 200,
						header: { 'content-type': 'text/javascript'},
						body: content
					  }
				}
			}

			if(wrapper_script === '/cert'){
				return {
					response: {
						statusCode: 200,
						header: { 'content-type': 'application/txt', "Content-Disposition": 'attachment; filename="WAFL.crt"', "Connection": "close" },
						body: fs.readFileSync(process.env.CERT_PATH) 
					  }
				}
			}
			if(wrapper_script === '/instrument'){
				const WASM_HASH = 'test' // md5sum.update(requestDetail.requestData).digest("hex")

				// SAVE Metadata in mongodb
				// SAVE WASM binary
				MongoClient.connect(mongoUrl, function(err, db) {
					if (err) throw err;
					var dbo = db.db("wafl");
					var myobj = {requestOptions: requestDetail.requestOptions, wasm: requestDetail.requestData, hash: WASM_HASH};


					dbo.collection("requests").insertOne(myobj, function(err, res) {
					  if (err) throw err;
					  console.log(`1 request inserted`);
					  db.close();
					});
				  });


				// SAVE WASM binary locally, generate random id and save it in the mongodb
				const pWasmFile = `wasms/${WASM_HASH}.wasm`
				fs.writeFileSync(pWasmFile, requestDetail.requestData)

				let metaData  =  exec(`${process.env.SWAM_BIN} coverage  ${__dirname}/${pWasmFile} --export-instrumented ${__dirname}/${pWasmFile}.cb.wasm --instrumentation-type global-callback`);
				metaData = JSON.parse(metaData)
				const response = {
					instrumented: null, hash:WASM_HASH, name:"temp", metaData
				}
				const stream = JSON.stringify(response);

				console.log(stream.length)

				return {
					response: {
						statusCode: 200,
						header: { 'content-type': 'application/json'},
						body: stream
					  }
				}
			}

			return {
				response: {
					statusCode: 200,
					header: { 'content-type': 'text/html' },
					body: fs.readFileSync("pages/index.html") // TODO return README webpage about wafl
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
		const routerJS  = `<script type="text/javascript">window.INSTRUMENTER_HOST='${INSTRUMENT_URL}'</script>\n`

		const content = fs.readFileSync(`./static/${process.env.INSTRUMENTATION_TYPE}`);
		const dashboardIndex = fs.readFileSync(`./static/index.js`);

		const instrumentationJS = `<script type="text/javascript">${content}</script>\n`
		const dashBoardJS = `<script type="text/javascript">${dashboardIndex}</script>\n`
		data = data.replace("<head>", `<head>${routerJS}${instrumentationJS}\n`)

		if(data.indexOf("</body>") > -1)
			data = data.replace("</body>", `\n${dashBoardJS}\n</body>\n`)
		if(data.indexOf("<body>") > -1)
			data = data.replace("<body>", `<body>\n${dashBoardJS}\n`)

		//console.log(data)
		
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