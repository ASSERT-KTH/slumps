require('dotenv').config()

const AnyProxy = require('anyproxy');
const fs = require("fs");
var MongoClient = require('mongodb').MongoClient;
const mongoUrl = process.env.MONGO_DB ||  "mongodb://localhost:27017/mydb";
const WAKOKO_RATE = process.env.WAKOKO_RATE || 500; // poll every 3 seconds
const crypto = require('crypto');
const { exception } = require('console');
var exec = require('child_process').execSync;


MongoClient.connect(mongoUrl, function(err, db) {
	if (err) throw err;

	var dbo = db.db("wakoko");
	if(!dbo.collection("requests"))
		dbo.createCollection("requests", function(err, res) {
	if (err) throw err;
	
    console.log("Collection created!");
    db.close();
  });
});

const PORT = process.env.WAKOKO_PORT || 8080
const INSTRUMENT_URL = "https://wakoko.com"
const MASKED_URL=/^https?:\/\/wakoko.com/
const LOCALHOST = new RegExp(`^https?:\/\/(localhost|0\.0\.0\.0|127\.0\.0\.1):${PORT}(\/.+)?`)

console.log(INSTRUMENT_URL, process.env.SWAM_BIN, process.env.WAKOKO_RATE)
const options = {
  port: PORT,
  throttle: 10000,
  forceProxyHttps: true,
  wsIntercept: false,
  silent: true,
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
						header: { 'Content-Type': 'text/javascript'},
						body: content
					  }
				}
			}

			if(wrapper_script === '/cert'){
				
				return {
					response: {
						statusCode: 200,
						header: {  'Content-Type': 'application/txt', "Content-Disposition": 'attachment; filename="WAKOKO.crt"', "Connection": "close" },
						body: fs.readFileSync(process.env.CERT_PATH) 
					  }
				}
			}
			if(wrapper_script === '/instrument'){

				console.log(requestDetail.requestOptions.method)

				if(requestDetail.requestOptions.method === 'OPTIONS'){
					console.log("RETURNING OPTIONS")
					return {
						response: {
							statusCode: 200,
							header: { 
								
								'Access-Control-Allow-Origin': '*', 
								'Allow': 'OPTIONS, HEAD, POST',
								'Access-Control-Allow-Headers': 'access-control-allow-methods,access-control-allow-origin,content-type',
								'Server': 'WAKOKO'},
						}
					}
				}
				console.log(requestDetail.requestOptions.method)
				if(requestDetail.requestOptions.method === 'POST'){
					console.log("INSTRUMENTING")
					// SAVE metadata in mongodb
					// SAVE WASM binary
					// Create a fresh hash for each iteration
					const md5sum = crypto.createHash('md5');
					const WASM_HASH = md5sum.update(requestDetail.requestData).digest("hex")
					const pWasmFile = `wasms/${WASM_HASH}.wasm`
					let metadata = null

					console.log(requestDetail.requestData.length)
					if(!requestDetail.requestData || requestDetail.requestData.length == 0){
						console.log("Bypassing instrumentation...")
						return {
							response: {
								statusCode: 200,
								header: { 
									//...requestDetail.requestOptions.headers,
									'Content-Type': 'application/json' , 
									'Content-Length': 0, 
									'Connection': 'close', 
									'Access-Control-Allow-Origin': '*', 
									'Server': 'WAKOKO'},
								body: ''
							}
						}
					}
					let db = await MongoClient.connect(mongoUrl);
					var dbo = db.db("wakoko");
					let record = await dbo.collection("requests").findOne({
						hash: WASM_HASH
					});

					console.log(WASM_HASH)
					if(!!record){ // CACHE querying
						metadata = record.instrumentationData
					}
					else{
						// SAVE WASM binary locally, generate random id and save it in the mongodb
						fs.writeFileSync(pWasmFile, requestDetail.requestData)
						try{
							metadata  =  exec(`${process.env.SWAM_BIN} coverage  ${__dirname}/${pWasmFile} --export-instrumented ${__dirname}/${pWasmFile}.cb.wasm --instrumentation-type global-callback`);
							metadata = JSON.parse(metadata)

							let db = await MongoClient.connect(mongoUrl);

							var dbo = db.db("wakoko");
							var myobj = {requestOptions: requestDetail.requestOptions, wasm: requestDetail.requestData, hash: WASM_HASH, instrumentationData: metadata};

							await dbo.collection("requests").insertOne(myobj);

							db.close();

							console.log(`1 request inserted`);
						}
						catch(e){
							console.log(`Failed to instrument ${e}`);
							return;
						}
						
					}

					let content = [...fs.readFileSync(`${__dirname}/${pWasmFile}.cb.wasm`)];

					// console.log(metadata)
					const response = {
						instrumented: content, hash:WASM_HASH, name:"temp", metadata
					}
					const stream = JSON.stringify(response);
					

					return {
						response: {
							statusCode: 200,
							header: { 
								//...requestDetail.requestOptions.headers,
								'Content-Type': 'application/json' , 
								'Content-Length': stream.length, 
								'Connection': 'close', 
								'Access-Control-Allow-Origin': '*', 
								'Server': 'WAKOKO'},
							body: stream
						}
					}
				}
			}

			return {
				response: {
					statusCode: 200,
					header: { 'content-type': 'text/html' },
					body: fs.readFileSync("pages/index.html") // TODO return README webpage about wakoko
				  }
			}
		}

		if(LOCALHOST.test(requestDetail.url)){
			return {
				response: {
					statusCode: 200,
					header: { 'content-type': 'text/html' },
					body: fs.readFileSync("pages/index.html") // TODO return README webpage about wakoko
				  }
			}
		}

	},
	beforeSendResponse: async function (requestDetail, responseDetail) {

		if(/.*wasm$/.test(requestDetail.url)) // do nothing to WASM
			return

		console.log(requestDetail.url)

		if(MASKED_URL.test(requestDetail.url))
			return
		if(responseDetail.response.statusCode !== 200)
			return
		if(responseDetail.response.header["Content-Type"]){
			if(responseDetail.response.header["Content-Type"].indexOf("text/html") === -1) // Instrument only html responses
				return
		}

		// INJECT WAFL script
		let data = responseDetail.response.body.toString();
		const routerJS  = `<script type="text/javascript">window.INSTRUMENTER_HOST='${INSTRUMENT_URL}';\n window.WAKOKO_RATE=${WAKOKO_RATE};\n</script>\n` // Set global host for instrumentation and open the address to force user to ttrust the site

		const content = fs.readFileSync(`./static/${process.env.INSTRUMENTATION_TYPE || 'wrapper_global.js'}`);

		const instrumentationJS = `<script type="text/javascript">${content}</script>\n`
		
		const dashBoardJS = `<script src="${INSTRUMENT_URL}/static/index.js" type="text/javascript"></script>\n`
		data = data.replace("<head>", `<head>${routerJS}${instrumentationJS}\n`)

		if(data.indexOf("</body>") > -1)
			data = data.replace("</body>", `\n${dashBoardJS}\n</body>\n`)
		else if(data.indexOf("<body>") > -1)
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