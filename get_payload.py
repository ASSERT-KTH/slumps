import re
import sys


# TODO: Write this straight into crow.yml and replace exit(1) with exit(0)
if __name__ == "__main__":
    # message format protocol

    # Looking for pattern: "CROW: <path>""
    match = re.match(r'^CROW: (.*)$', sys.argv[1])

    if match:
        print(match.group(1))
    else:
        exit(1)
