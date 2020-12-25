import pika
import sys
from settings import config
from logger import LOGGER, getlogfilename
import json
import base64
import traceback
import hashlib
import redis
import re

from stages import CToLLStage, LLToBC, BCToSouper, ObjtoWASM, WASM2WAT, BCCountCandidates, TimeoutException
from utils import printProgressBar, createTmpFile, getIteratorByName, \
	ContentToTmpFile, BreakException, RUNTIME_CONFIG, updatesettings

class Subscriber:
	def __init__(self, id, queueName, bindingKey, port):
		self.queueName = queueName
		self.bindingKey = bindingKey
		self.id = id
		self.port = port
		self.connection = self._create_connection()
  
	def __del__(self):
		self.connection.close()

	def _create_connection(self):
		parameters=pika.ConnectionParameters(host=config['eb']['host'],port = config['eb']['port'])
		return pika.BlockingConnection(parameters)

	def generate_variant(self, bc, program_name, name, toApply, OUT="."):
		LOGGER.info(program_name, f"Cleaning previous cache for variant generation...{self.port}")
		r = redis.Redis(host="localhost", port=self.port)
		try:
			LOGGER.success(program_name, f"Flushing redis DB...")

			result = r.flushall()
			LOGGER.success(program_name, f"DB flushed away: result({result})")
		except Exception as e:
			LOGGER.error(program_name, traceback.format_exc())

		# Set keys
		name = ""

		try:            
			#keys = list(merging.keys())
			for k, v in toApply.items():
				LOGGER.info(program_name, f"Setting redis db")

				if v is not None:
					#name +=  "[%s-%s]"%(keys.index(k), merging[k].index(v))
					r.hset(k, "result", v)
				else:
					#name +=  "[%s-n]"%(keys.index(k),)
					# search for infer word
					rer = re.compile(r"infer %(\d+)")
					kl = k
					if rer.search(kl):
						r.hset(k, "result", ("result %%%s\n"%(rer.search(kl).group(1),)).encode("utf-8"))
					LOGGER.info(program_name, f"Replacing redundant key-value pair...")

			LOGGER.info(program_name, f"Preparing new variant generation...")
			with ContentToTmpFile(content=bc, LOG_LEVEL=2, outFolder=OUT) as BCIN:
				tmpIn = BCIN.file
				with ContentToTmpFile(LOG_LEVEL=2, outFolder=OUT) as BCOUT:
					tmpOut = BCOUT.file
					
					try:
						sanitized_set_name = name
						LOGGER.info(program_name, f"Generating variant {sanitized_set_name}...")


						optBc = BCToSouper(program_name, level=1, debug=True, redisport=self.port, timeout=config["DEFAULT"].getint("generation-simple-timeout") - 1)
						optBc(args=[tmpIn, tmpOut], std=None)

						bsOpt = open(tmpOut, 'rb').read()

						# Generate wasm
						n = "%s[%s]" % (program_name,sanitized_set_name)
						hex, size, wasmFile, watFile = self.generateWasm(program_name, bsOpt,
																		OUT,
																		name,
																		debug=True, generateOnlyBc=False)

					except Exception as e:
						LOGGER.error(program_name, traceback.format_exc(), )
						raise e
		except Exception as e:
			LOGGER.error(program_name, traceback.format_exc())
		finally:

			LOGGER.info(program_name, "Cleaning cache from variant generation...")
			
			result = r.flushdb()
			LOGGER.success(
				program_name, f"Flushing redis DB: result({result})")
			r.close()
			LOGGER.info(program_name, "Cleaning cache from variant generation...")
		
		#result = r.flushdb()
		#LOGGER.success(
		#	program_name, f"Flushing redis DB: result({result})")
		#r.close()

	def generateWasm(self, namespace, bc, OUT_FOLDER, fileName, debug=True, generateOnlyBc=False):
		llFileName = "%s/%s" % (OUT_FOLDER, fileName)

		with ContentToTmpFile(name="%s.bc" % llFileName, content=bc, ext=".bc", persist=True) as TMP_WASM:

			tmpWasm = TMP_WASM.file

			try:
				if not generateOnlyBc:
					finalObjCreator = ObjtoWASM(namespace, debug=debug)
					finalObjCreator(args=[
						"%s.wasm" % (llFileName,),
						tmpWasm
					], std=None)

					wat = WASM2WAT(namespace, debug=debug)
					wat(std=None, args=[
						"%s.wasm" % (llFileName,),
						"%s.wat" % (llFileName,)]
						)
					finalStream = open("%s.wasm" % (llFileName,), 'rb').read()
					hashvalue = hashlib.sha256(finalStream)

					if debug:
						LOGGER.warning(namespace, "%s: WASM SIZE %s" %
									(namespace, len(finalStream),))
						LOGGER.warning(namespace, "%s: WASM SHA %s" %
									(namespace, hashvalue.hexdigest(),))
					return hashvalue.hexdigest(), len(finalStream), "%s.wasm" % (llFileName,), "%s.wat" % (llFileName,)
				else:
					hashvalue = hashlib.sha256(bc)
					return hashvalue.hexdigest(), len(bc), "%s.bc" % (fileName,), "%s.bc" % (fileName,)
			except Exception as e:
				LOGGER.error(namespace, traceback.format_exc())

	def on_message_callback(self, channel, method, properties, body):
		binding_key = method.routing_key
		data = json.loads(body.decode())

		program_bytes = base64.b64decode(data["bitcode"])

		self.generate_variant(program_bytes, data["name"],data["name"], data["set"])
		print(f"id:{self.id} received new message")

	def setup(self):
		channel = self.connection.channel()
		channel.exchange_declare(exchange=config['eb']['exchange'],exchange_type=config['eb']['exchange-type'])
		# This method creates or checks a queue
		channel.queue_declare(queue=self.queueName)
		# Binds the queue to the specified exchang
		channel.queue_bind(queue=self.queueName,exchange=config['eb']['exchange'],routing_key=self.bindingKey)
		channel.basic_consume(queue=self.queueName, on_message_callback=self.on_message_callback, auto_ack=True)
		print(f'id:{self.id} [*] Waiting for data for ' + self.queueName + '. To exit press CTRL+C')
		try:
			channel.start_consuming()
		except KeyboardInterrupt:
			channel.stop_consuming()

updatesettings(sys.argv[2:-1])

if __name__ == "__main__":

	if len(sys.argv) < 1:
		print('Usage: ' + __file__ + ' <QueueName>')
		sys.exit()
	else:
		queueName = sys.argv[1]
		#key in the form exchange.*
		key = config["eb"]["process-id"]
		subscriber = Subscriber(1, queueName, key, 3049)
		subscriber.setup()