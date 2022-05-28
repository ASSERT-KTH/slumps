import socket
import json
from crow.monitor.logger import LOGGER
import traceback

def set_default(obj):
    if isinstance(obj, set):
        return list(obj)
    raise TypeError

def listen(port, q, program, worker_id, level, timeout, emit_generation=True):

	HOST = '0.0.0.0'  # Standard loopback interface address (localhost)
	PORT = port

	with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as s:
		print(f"Getting port {program} {port}")
		if program:
			LOGGER.info(program,f"Getting port {port}")
		#s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

		s.settimeout(timeout)
		s.bind((HOST, PORT))
		print(f"Listening...{port} {HOST}")

		if program:
			LOGGER.info(program,f"Listening...{port} {HOST}")

		try:
			s.listen()
			conn, addr = s.accept()
			LOGGER.info(program,f"Accepted...{addr}")

			print(f"Accepted...{addr}")
			with conn:
				if program:
					LOGGER.success(program,f'{program} Connected by {addr}')

				print(f'Connected by {addr}')
				while True:
					data = conn.recv(1024<<8)
					data = data.replace('\\'.encode(), '\\\\'.encode()).replace('\n'.encode(), '\\n'.encode())
					st = f"[{data.decode()[:-1]}]"

					try:
						js = json.loads(st)

						for kvpair in js:
							k, v, bId = kvpair["key"], kvpair["value"], kvpair["bId"]
							if q:
								q(level,k, v)
						#print(f"level {level} tentative {s}")
					except Exception as e:
						#print(data)
						print(traceback.format_exc(), st)
						break
					if not data:
						break
		except Exception as e:
			print(f"Socket timeout {e}")
			return

	return
				


if __name__ == "__main__":
	import sys
	listen(int(sys.argv[1]), None, None, "Test", "-1", 60)