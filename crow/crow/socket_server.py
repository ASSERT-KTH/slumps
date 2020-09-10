import socket
import json
from logger import LOGGER
import numpy as np
from utils import printProgressBar

def listen(port, q, program):


	HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
	PORT = port
	result = {}

	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		s.bind((HOST, PORT))
		if program:
			LOGGER.info(program,f"Listening...{port}")
		
		s.listen()
		conn, addr = s.accept()
		with conn:
			if program:
				LOGGER.success(program,f'Connected by {addr}')
			while True:
				data = conn.recv(1024<<6)
				data = data.replace('\\'.encode(), '\\\\'.encode()).replace('\n'.encode(), '\\n'.encode())
				st = f"[{data.decode()[:-1]}]"

				try:
					js = json.loads(st)

					for kvpair in js:
						k, v = kvpair["key"], kvpair["value"]
						
						if not program:
							#print(f"{k} -> {v}")
							print(f"Populating results...{len(result.keys())} keys")
							print(f"Populating results...{s} temptative replacements")
						if k not in result:
							result[k] = set([])

						result[k].add(v)
						if q:
							q.put([k, v])


					if program:
						s = np.prod([len(t) for t in result.values()])
						printProgressBar(0, 1, length=5, suffix=f"{len(result.keys())} keys. {s} temptative replacements")
						
					
				except Exception as e:
					print(st)
				if not data:
					break
				


if __name__ == "__main__":
	listen(32145, None, None)