import json
import sys



if __name__ == "__main__":

    try:
        in_ = sys.stdin.read()
        r = json.loads(in_)
        
        for e in r:
            for _, v in e.items():
                print(json.dumps(v, indent=4))
    except:
        pass