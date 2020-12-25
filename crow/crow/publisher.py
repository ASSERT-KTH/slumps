import pika
from settings import config
from logger import LOGGER, getlogfilename
import sys
import json
import base64

class Publisher:

	def publish(self, routing_key, message):       
		connection = self.create_connection()
		# Create a new channel with the next available channel number or pass in a channel number to use 
		channel = connection.channel()
		# Creates an exchange if it does not already exist, and if the exchange exists,
		# verifies that it is of the correct and expected class.
		channel.exchange_declare(exchange=config["eb"]["exchange"], exchange_type=config["eb"]["exchange-type"])
		#Publishes message to the exchange with the given routing key
		channel.basic_publish(exchange=config["eb"]["exchange"], routing_key=routing_key, body=json.dumps(message))
		print("[x] Sent message")
		#LOGGER.info("events","[x] Sent message %r for %r" % (message,routing_key))

  # Create new connection
	def create_connection(self):
		param = pika.ConnectionParameters(host=config["eb"]["host"], port=config["eb"]["port"]) 
		return pika.BlockingConnection(param)


if __name__ == "__main__":
	publisher = Publisher()
	for i in range(1):
		publisher.publish(config["eb"]["process-id"], dict(
			name="test.bc",
			bitcode=base64.b64encode(open(sys.argv[1], 'rb').read()).decode(),
			set={
				"%0:i32 = var (knownBits=0xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx) (nonNegative) (range=[0,100))\n%1:i32 = addnsw 1:i32, %0 (hasExternalUses)\n%2:i1 = slt %1, 100:i32\ninfer %2\n": "%3:i1 = and %2, %2\n%4:i1 = and %3, %2\n%5:i1 = and %4, %2\n%6:i1 = and %5, %2\n%7:i1 = and %6, %2\n%8:i1 = and %7, %2\n%9:i1 = and %8, %2\n%10:i1 = and %9, %2\n%11:i1 = and %10, %2\n%12:i1 = and %11, %2\n%13:i1 = and %12, %2\n%14:i1 = and %13, %2\n%15:i1 = and %14, %2\n%16:i1 = and %15, %2\nresult %16\n"
			}
		))