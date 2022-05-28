import sys
import os
import json
import hashlib

if __name__ == "__main__":

    f = open(sys.argv[1], 'r').read()
    data = json.loads(f)
    

    if os.path.exists('classification_of_reversed.json'):
        classification = json.loads(open("classification_of_reversed.json", 'r').read())

        for k, items in classification.items():
            print(items[0])

            print("=====")
    