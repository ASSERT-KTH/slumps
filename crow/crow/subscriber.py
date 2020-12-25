import pika
import sys
from settings import config
from logger import LOGGER, getlogfilename

class Subscriber:
	def __init__(self, queueName, bindingKey):
		self.queueName = queueName
		self.bindingKey = bindingKey
		self.connection = self._create_connection()
  
	def __del__(self):
		self.connection.close()

	def _create_connection(self):
		parameters=pika.ConnectionParameters(host=config['eb']['host'],port = config['eb']['port'])
		return pika.BlockingConnection(parameters)

	def on_message_callback(self, channel, method, properties, body):
		binding_key = method.routing_key
		print("received new message for -" + binding_key + body.decode())

	def setup(self):
		channel = self.connection.channel()
		channel.exchange_declare(exchange=config['eb']['exchange'],exchange_type=config['eb']['exchange-type'])
		# This method creates or checks a queue
		channel.queue_declare(queue=self.queueName)
		# Binds the queue to the specified exchang
		channel.queue_bind(queue=self.queueName,exchange=config['eb']['exchange'],routing_key=self.bindingKey)
		channel.basic_consume(queue=self.queueName, on_message_callback=self.on_message_callback, auto_ack=True)
		print(' [*] Waiting for data for ' + self.queueName + '. To exit press CTRL+C')
		try:
			channel.start_consuming()
		except KeyboardInterrupt:
			channel.stop_consuming()

if __name__ == "__main__":

	if len(sys.argv) < 2:
		print('Usage: ' + __file__ + ' <QueueName> <BindingKey>')
		sys.exit()
	else:
		queueName = sys.argv[1]
		#key in the form exchange.*
		key = sys.argv[2]
		subscriber = Subscriber(queueName, key)
		subscriber.setup()