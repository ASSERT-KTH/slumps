import socket
import json
from logger import LOGGER
import numpy as np
from utils import printProgressBar, NOW
from ansi_ui import SCREEN
from settings import config
import traceback
from functools import reduce
import operator
import time
from event_manager import Publisher
#import matplotlib.pyplot as plt

def set_default(obj):
    if isinstance(obj, set):
        return list(obj)
    raise TypeError

def listen(port, q, program, worker_id, level, emit_generation=True):


	HOST = '127.0.0.1'  # Standard loopback interface address (localhost)
	PORT = port
	result = {}

	stats = []
	publisher = None

	if emit_generation:
		publisher = Publisher()
	
	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		if program:
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
						
						if program and not config["DEFAULT"].getboolean("use-ansi-console"):
							#print(f"{k} -> {v}")
							LOGGER.info(program, f"Populating results...{len(result.keys())} blocks")
							LOGGER.info(program, f"Populating results...{s} tentative replacements")
							#LOGGER.info(program, "KEYS\n%s"%(json.dumps(result, indent=4, default=set_default)))
						if k not in result:
							result[k] = set([])

						result[k].add(v)
						if q:
							q.put([k, v])


					s=reduce(operator.mul, [len(t) + 1 for t in result.values()], 1)
					#print(worker_id)
					if publisher is not None:
						configKey = "%s %s %s %s %s"%(
							config["souper"]["souper-level-19"],
							config["DEFAULT"]["generation-timeout"],
							config["DEFAULT"]["exploration-timeout"],
							config["souper"]["workers"],
							config["souper"]["souper-common"]
						)
						publisher.publish(config["event"]["process-id-exploration"], dict(
							event_type="COMMING REPLACEMENT",
							total=s,
							time=time.time() - NOW,
							config=configKey
						))
				
					if program:
						if config["DEFAULT"].getboolean("use-ansi-console"):
							SCREEN.update_process(worker_id, total=None, suffix = f"Probable count: {s} Keys: {len(result)} Level: {level} ")
							#SCREEN.place_log(f"{k}: {v}")
						#printProgressBar(0, 1, length=1, suffix=f"{len(result.keys())} blocks. {s} probable replacements")
						
					
				except Exception as e:
					print(traceback.format_exc())
					if program:
						pass
						#LOGGER.info(program, "KEYS\n%s"%(json.dumps(result, indent=4, default=set_default)))
					else:
						print("KEYS\n%s"%(json.dumps(result, indent=4, default=set_default)))
					
					return result
				if not data:
					break
	#print()

	if program:
		pass
		#LOGGER.info(program, "KEYS\n%s"%(json.dumps(result, indent=4, default=set_default)))
	else:
		print("KEYS\n%s"%(json.dumps(result, indent=4, default=set_default)))

	return result
				


if __name__ == "__main__":
	import sys
	listen(int(sys.argv[1]), None, None, "Test", "-1")