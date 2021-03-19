import socket
import json
from crow.monitor.logger import LOGGER
from crow.utils import NOW
from crow.settings import config
import traceback
from functools import reduce
import operator
from crow.utils import printinSameLine

import time
from crow.events.event_manager import Publisher
#import matplotlib.pyplot as plt

def set_default(obj):
    if isinstance(obj, set):
        return list(obj)
    raise TypeError

def listen(port, q, program, worker_id, level, timeout, emit_generation=True):

	HOST = '0.0.0.0'  # Standard loopback interface address (localhost)
	PORT = port

	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		if program:
			LOGGER.info(program,f"Getting port {port}")
		#s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

		s.settimeout(timeout)
		s.bind((HOST, PORT))
		if program:
			LOGGER.info(program,f"Listening...{port} {HOST}")

		try:
			s.listen()
			conn, addr = s.accept()
			LOGGER.info(program,f"Accepted...{addr}")

			with conn:
				if program:
					LOGGER.success(program,f'Connected by {addr}')
				while True:
					data = conn.recv(1024<<8)
					data = data.replace('\\'.encode(), '\\\\'.encode()).replace('\n'.encode(), '\\n'.encode())
					st = f"[{data.decode()[:-1]}]"

					try:
						js = json.loads(st)

						for kvpair in js:
							k, v = kvpair["key"], kvpair["value"]

							if q:
								#print(k, v)
								q(level,k, v)
						#print(f"level {level} tentative {s}")
					except Exception as e:
						#print(data)
						print(traceback.format_exc())
						break
					if not data:
						break
		except:
			print("Socket timeout")
			return

	return
				


if __name__ == "__main__":
	import sys
	listen(int(sys.argv[1]), None, None, "Test", "-1")