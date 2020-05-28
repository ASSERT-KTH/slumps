import re
import sys

if __name__ == "__main__":
    # message format protocol
    # CROW: <path>
    r = re.compile(r'^CROW: (.*)$')

    m = r.match(sys.argv[1])

    if m:
        print(m.group(1))
    else:
        exit(1)