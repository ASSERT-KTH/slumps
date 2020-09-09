import socket
import json
from logger import LOGGER
import numpy as np

def listen(port, q, program):


	HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
	PORT = port
	result = {}

	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		s.bind((HOST, PORT))
		print(f"Listening...{port}")
		
		s.listen()
		conn, addr = s.accept()
		with conn:
			print('Connected by', addr)
			while True:
				data = conn.recv(1024<<6)
				data = data.replace('\\'.encode(), '\\\\'.encode()).replace('\n'.encode(), '\\n'.encode())
				st = f"[{data.decode()[:-1]}]"

				try:
					js = json.loads(st)

					for kvpair in js:
						k, v = kvpair["key"], kvpair["value"]
						
						if k not in result:
							result[k] = []

						result[k].append(v)
						q.put([k, v])
					LOGGER.success(program,f"Populating results...{len(result.keys())} keys")
					s = np.prod([len(t) for t in result.values()])
					LOGGER.success(program,f"Populating results...{s} tentative replacements")
				except Exception as e:
					print(st)
				if not data:
					break
				


if __name__ == "__main__":
	listen(65435, None, None)