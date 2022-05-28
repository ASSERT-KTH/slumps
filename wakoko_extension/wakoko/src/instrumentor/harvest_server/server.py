from flask import Flask, flash, request, redirect, url_for, jsonify
import os
import flask
from flask_cors import CORS, cross_origin

app = Flask(__name__)
CORS(app)

UPLOAD_FOLDER = os.path.dirname(__file__)
UPLOAD_FOLDER = os.path.join(UPLOAD_FOLDER, "binaries")

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER
ALLOWED_EXTENSIONS = {'wasm'}

def allowed_file(filename):
    return '.' in filename and \
           filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

# Solution from https://modernweb.com/unlimited-access-with-cors/
@app.after_request
def add_cors(resp):
    """ Ensure all responses have the CORS headers. This ensures any failures are also accessible
        by the client. """
    resp.headers['Access-Control-Allow-Origin'] = flask.request.headers.get('Origin','*')
    resp.headers['Access-Control-Allow-Credentials'] = 'true'
    resp.headers['Access-Control-Allow-Methods'] = 'POST, OPTIONS, GET'
    resp.headers['Access-Control-Allow-Headers'] = flask.request.headers.get( 
        'Access-Control-Request-Headers', 'Authorization' )
    # set low for debugging
    if app.debug:
        resp.headers['Access-Control-Max-Age'] = '1'
    return resp

@app.route('/store/<name>', methods=['POST', 'OPTIONS', 'GET'])
@cross_origin()
def upload_file(name):
    print("Entering")
    response = jsonify(message="Done")              
    if request.method == 'POST':
        f = open(f"{app.config['UPLOAD_FOLDER']}/{name}.wasm", 'wb')
        f.write(request.data)
    response.headers.add("Access-Control-Allow-Origin", "*")
    return response

app.run(debug=True, port=8000)