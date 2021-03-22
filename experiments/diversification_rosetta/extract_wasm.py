import sys

from pymongo import MongoClient
import os
import base64

if __name__ == "__main__":

    OUT_FOLDER = sys.argv[1]

    client = MongoClient('mongodb://localhost:27017/')

    with client:
    
        db = client.crow3
        wasms = db.wasms.find()

        for wasm in wasms:

            folder_name = wasm["original"]
            folder_name = f"{OUT_FOLDER}/{folder_name}"

            if not os.path.exists(folder_name):
                os.mkdir(folder_name)

            binary = base64.b64decode(wasm["binary"]) 
            fbin = f"{folder_name}/{wasm['name']}"

            open(fbin, 'wb').write(binary)
            #print(wasm)