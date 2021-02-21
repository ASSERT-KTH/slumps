import pika
import sys
import json
import base64
import threading
import time
from crow.settings import config
import uuid
import base64
import traceback

TOBASE64_FIELDS = ["stream", "bc", "ll"]

def serialize_message(message):

    result = {}
    for k in message.keys():
        if k in TOBASE64_FIELDS:
            base64_bytes = base64.b64encode(message[k])
            base64_message = base64_bytes.decode('utf-8')
            result[k] = base64_message
        else:
            result[k] = message[k]

    return result

def deserialize_message(message):

    result = {}
    for k in message.keys():
        if k in TOBASE64_FIELDS:
            base64_bytes = message[k].encode('utf-8')
            base64_message = base64.b64decode(base64_bytes)
            result[k] = base64_message
        else:
            result[k] = message[k]

    return result

class Publisher:

    def publish(self, message, routing_key ):

        if "event_type" not in message:
            raise Exception("All published messages should contain the 'event_type'")

        message["id"] = f"{uuid.uuid4()}"

        connection = self.create_connection()
        # Create a new channel with the next available channel number or pass in a channel number to use 
        channel = connection.channel()
        # Creates an exchange if it does not already exist, and if the exchange exists,
        # verifies that it is of the correct and expected class.
        channel.exchange_declare(exchange=config["event"]["exchange"], exchange_type=config["event"]["type"])
        #Publishes message to the exchange with the given routing key

        # transform json
        serialized = serialize_message(message)
        channel.basic_publish(exchange=config["event"]["exchange"], routing_key=routing_key, body=json.dumps(serialized))
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
        try:
            parameters=pika.ConnectionParameters(host=config["event"]["host"],port = config["event"].getint("port"))
            return pika.BlockingConnection(parameters)
        except Exception as e:
            print(f"Impossible to create the service...backingoff")
            time.sleep(2)
            return self._create_connection()
    

    def on_message_callback(self, channel, method, properties, body):
        binding_key = method.routing_key
        #print(body)
        deserialized = deserialize_message(json.loads(body.decode()))

        self.callback(deserialized)

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

        except Exception as e:
            print("The service suddenly stop....backing off")
            print(e)
            time.sleep(2) # Backoff and restart
            self.setup()




def test_subscriber():

    key = config["event"]["process-id-exploration"]
    subscriber = Subscriber(1, config["event"]["queue-name"], key, config["event"].getint("port"), lambda x: print(x))
    subscriber.setup()


#DECORATORS
def subscriber_function(event_type=None):
    def wrapper(func):
        def _filter(*args, **kwargs):

            if len(args) != 1 or len(kwargs) != 0:
                raise Exception("The subscriber function should receive only on parameter")
            
            if "event_type" not in args[0]:
                raise Exception("The data should contain a 'event_type' key")

            if event_type != "*" and event_type != args[0]["event_type"]:
                return # return if this function is not prepared for this kind of message

            return func(*args, **kwargs)

        return _filter

    return wrapper

@subscriber_function(event_type="a")
def receiver(data):
    print(data)

if __name__ == "__main__":

    receiver(dict(event_type="TEST_PACKAGE"))
    #tr = threading.Thread(target=test_subscriber)
    #tr.start()

    #time.sleep(5)
    #publisher = Publisher()
    #for i in range(1):
    #    publisher.publish(EXCHANGE_PROCESS_ID, dict(
    #        event_type="DEPLOYMENT_DONE"
    #    ))

    #tr.join()