import socket
import json
from crow.monitor.logger import LOGGER
from crow.utils import NOW
from crow.settings import config
import traceback
from functools import reduce
import operator
import time
from crow.events.event_manager import Publisher
#import matplotlib.pyplot as plt

def set_default(obj):
    if isinstance(obj, set):
        return list(obj)
    raise TypeError

def listen(port, q, program, worker_id, level, emit_generation=True):

	HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
	PORT = port
	result = {}

	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		if program:
			LOGGER.info(program,f"Getting port {port}")
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

						if k not in result:
							result[k] = set([])

						result[k].add(v)
						if q:
							q.put([k, v])


					s=reduce(operator.mul, [len(t) + 1 for t in result.values()], 1)

				except Exception as e:
					print(traceback.format_exc())
					
					return result
				if not data:
					break

	return result
				


if __name__ == "__main__":
	import sys
	listen(int(sys.argv[1]), None, None, "Test", "-1")