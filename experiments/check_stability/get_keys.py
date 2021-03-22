import json
import sys



if __name__ == "__main__":

    try:
        in_ = sys.stdin.read()
        r = json.loads(in_)
        
        for e in r:
            for k in e.keys():
                print(json.dumps(k, indent=4))
    except:
        pass