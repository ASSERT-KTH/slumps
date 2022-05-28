import sys
import os
import json
import hashlib

if __name__ == "__main__":

    f = open(sys.argv[1], 'r').read()
    data = json.loads(f)
    

    if os.path.exists('classification_of_reversed.json'):
        classification = json.loads(open("classification_of_reversed.json", 'r').read())
    else:
        classification = {
            'done': []
        }
    
    if 'done' not in classification:
        classification['done'] = []

    try:
        COUNT = 0
        for modulename, module in data['modules'].items():
            for function in module['functions']:
                for pair in function['eq_pairs']['raw_diff']:
                    COUNT += 1
                # print(pair[0], pair[1])
                    print("=======")
                    hsh = hashlib.sha256(pair.encode()).hexdigest()

                    if hsh in classification['done']:
                        continue
                    else:
                        classification['done'].append(hsh)

                    print(pair)
                    print(COUNT)
                    g = int(input())

                    if g not in classification:
                        classification[g] = []
                    
                    classification[g].append(pair)
    except:
        open("classification_of_reversed.json", 'w').write(json.dumps(classification, indent=4))
    