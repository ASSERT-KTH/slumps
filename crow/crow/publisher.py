import pika
from settings import config
from logger import LOGGER, getlogfilename

class Publisher:

	def publish(self, routing_key, message):       
		connection = self.create_connection()
		# Create a new channel with the next available channel number or pass in a channel number to use 
		channel = connection.channel()
		# Creates an exchange if it does not already exist, and if the exchange exists,
		# verifies that it is of the correct and expected class.
		channel.exchange_declare(exchange=config["eb"]["exchange"], exchange_type=config["eb"]["exchange-type"])
		#Publishes message to the exchange with the given routing key
		channel.basic_publish(exchange=config["eb"]["exchange"], routing_key=routing_key, body=message)
		print("[x] Sent message %r for %r" % (message,routing_key))
		#LOGGER.info("events","[x] Sent message %r for %r" % (message,routing_key))

  # Create new connection
	def create_connection(self):
		param = pika.ConnectionParameters(host=config["eb"]["host"], port=config["eb"]["port"]) 
		return pika.BlockingConnection(param)


if __name__ == "__main__":
	publisher = Publisher()
	publisher.publish('nse.nifty', 'New Data')