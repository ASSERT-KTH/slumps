import os
import sys

from flask import Flask, Response,url_for, request, make_response,session
import flask_cors
import flask
from base64 import encodebytes
import json
from subprocess import Popen, check_output
import hashlib

app = Flask(__name__)
app.secret_key=open("secret.key", 'rb').read()

app.config.from_object(__name__)
app.config['CORS_HEADERS'] = 'Content-Type'

cors = flask_cors.CORS(app, resources={r"/instrument": {"origins": "*"}})

with app.test_request_context():
	url_for('static', filename='wrapper.js')

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/instrument', methods=['POST'])
@flask_cors.cross_origin(send_wildcard=True,headers=['Content- Type','Authorization'], origin="*")
def instrument():

	# CALL SWAM to instrument WASM code
	SWAM_BIN_ENV = os.environ.get("SWAM_BIN")


	if not SWAM_BIN_ENV:
		return make_response(flask.jsonify(error="UNABLE TO LOCATE SWAM"), 500)

	# read metadatav
	hashvalue = hashlib.sha256(request.data)
	hsh = hashvalue.hexdigest()
	# Copy WASM to tmp folder
	originalWASM = open(f"tmp/{hsh}.wasm", 'wb')
	originalWASM.write(request.data)
	originalWASM.close()

	# set name as random
	# save hash for future cache


	absPath = os.path.abspath(f"tmp/{hsh}.wasm")
	outPath = os.path.abspath(f"tmp/{hsh}.instrumented.wasm")

	swamOutput = check_output(["java", "-jar", SWAM_BIN_ENV, "coverage", "--novalidate", "--export-instrumented", outPath, "--instrumentation-type", "global-callback", absPath], stderr=sys.stderr)
	print(swamOutput)
	swamOutput = swamOutput.decode()
	swamOutput = json.loads(swamOutput)

	print(swamOutput)
	# read instrumented
	instrumentedWASM = open(outPath, 'rb')



	encoded_wasm = encodebytes(instrumentedWASM.read()).decode('ascii') # encode as base64

	r = flask.jsonify(instrumented=encoded_wasm, hash=f"{hsh[:-20]}...", name="temp", metadata=swamOutput)
	#r.headers.add('Access-Control-Allow-Origin', '*')

	return r



if __name__ == '__main__':
    app.run(port=int(os.environ.get('PORT', 8080)))