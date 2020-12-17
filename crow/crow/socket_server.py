import socket
import json
from logger import LOGGER
import numpy as np
from utils import printProgressBar
from ansi_ui import SCREEN
from settings import config
import traceback
from functools import reduce
import operator

def listen(port, q, program, worker_id, level):


	HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
	PORT = port
	result = {}

	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		LOGGER.info(program,f"Getting port {port}")
		s.bind((HOST, PORT))
		if program:
			LOGGER.info(program,f"Listening...{port}")
			if config["DEFAULT"].getboolean("use-ansi-console"):
				SCREEN.update_process(worker_id, total=None, suffix = f"Starting Level: {level} ")
						
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
							LOGGER.info(f"Populating results...{len(result.keys())} blocks")
							LOGGER.info(f"Populating results...{s} tentative replacements")
						if k not in result:
							result[k] = set([])

						result[k].add(v)
						if q:
							q.put([k, v])


					if program:
						s=reduce(operator.mul, [len(t) + 1 for t in result.values()], 1)
						#print(worker_id)
						if config["DEFAULT"].getboolean("use-ansi-console"):
							SCREEN.update_process(worker_id, total=None, suffix = f"Probable count: {s} Keys: {len(result)} Level: {level} ")
						#printProgressBar(0, 1, length=1, suffix=f"{len(result.keys())} blocks. {s} probable replacements")
						
					
				except Exception as e:
					print(traceback.format_exc())
					exit(1)
				if not data:
					break
	#print()
				


if __name__ == "__main__":
	listen(32145, None, None)