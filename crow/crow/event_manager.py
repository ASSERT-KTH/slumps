import pika
import sys
import json
import base64
import threading
import time
from settings import config

class Publisher:

    def publish(self, routing_key, message):       
        connection = self.create_connection()
        # Create a new channel with the next available channel number or pass in a channel number to use 
        channel = connection.channel()
        # Creates an exchange if it does not already exist, and if the exchange exists,
        # verifies that it is of the correct and expected class.
        channel.exchange_declare(exchange=config["event"]["exchange"], exchange_type=config["event"]["type"])
        #Publishes message to the exchange with the given routing key
        channel.basic_publish(exchange=config["event"]["exchange"], routing_key=routing_key, body=json.dumps(message))
        #print("[x] Sent message")
        #LOGGER.info("events","[x] Sent message %r for %r" % (message,routing_key))

  # Create new connection
    def create_connection(self):
        param = pika.ConnectionParameters(host=config["event"]["host"], port=config["event"].getint("port")) 
        return pika.BlockingConnection(param)



class Subscriber:
    def __init__(self, id, queueName, bindingKey, port, callback):
        self.queueName = queueName
        self.bindingKey = bindingKey
        self.id = id
        self.port = port
        self.connection = self._create_connection()
        self.callback = callback
  
    def __del__(self):
        self.connection.close()

    def _create_connection(self):
        parameters=pika.ConnectionParameters(host=config["event"]["host"],port = config["event"].getint("port"))
        return pika.BlockingConnection(parameters)

    

    def on_message_callback(self, channel, method, properties, body):
        binding_key = method.routing_key
        data = json.loads(body.decode())

        self.callback(data)

        #print(f"id:{self.id} received new message")

    def setup(self):
        channel = self.connection.channel()
        channel.exchange_declare(exchange=config["event"]["exchange"],exchange_type=config["event"]["type"])
        # This method creates or checks a queue
        channel.queue_declare(queue=self.queueName)
        # Binds the queue to the specified exchang
        channel.queue_bind(queue=self.queueName,exchange=config["event"]["exchange"],routing_key=self.bindingKey)
        channel.basic_consume(queue=self.queueName, on_message_callback=self.on_message_callback, auto_ack=True)
        print(f'id:{self.id} [*] Waiting for data for ' + self.queueName + '. To exit press CTRL+C')

        try:
            channel.start_consuming()
        except KeyboardInterrupt:
            channel.stop_consuming()

def test_subscriber():

    key = config["event"]["process-id-exploration"]
    subscriber = Subscriber(1, config["event"]["queue-name"], key, config["event"].getint("port"), lambda x: print(x))
    subscriber.setup()


if __name__ == "__main__":

    tr = threading.Thread(target=test_subscriber)
    tr.start()

    #time.sleep(5)
    #publisher = Publisher()
    #for i in range(1):
    #    publisher.publish(EXCHANGE_PROCESS_ID, dict(
    #        event_type="DEPLOYMENT_DONE"
    #    ))

    tr.join()