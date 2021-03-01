import pika
import sys
import json
import base64
import threading
import time

from crow.events import GENERATE_VARIANT_MESSAGE
from crow.settings import config
import uuid
import base64
import traceback

TOBASE64_FIELDS = ["stream", "bc", "ll", "orignal_bc", "original_wasm"]


# Allow subscriber to have internal state
class Listener(object):

    def __call__(self, *args, **kwargs):

        if len(args) != 1 or len(kwargs) != 0:
            raise Exception("The subscriber function should receive only on parameter")

        if "event_type" not in args[0]:
            raise Exception("The data should contain a 'event_type' key")

        event_type: str = args[0]["event_type"]

        try:
            f = getattr(self, event_type.lower()) # use the lower case of the message type to redirect the message

            return f(args[0])

        except Exception as e:
            #print(e)
            try:
                f = getattr(self,"any") # parse any message
                return f(args[0])
            except Exception as e2:
                #print(e2)

                (filename, line_number, function_name, text) = traceback.extract_stack()[-2]
                def_name = text[:text.find('=')].strip()

                #print(f"WARNING {filename} {def_name} has not attribute {event_type.lower()}")


# DECORATORS
def function_discrimator(event_type=None):
    def wrapper(func):
        func.new_name = event_type.lower()
        return func
    return wrapper

def append_B(func):
  func.suffix='_B'
  return func

def listener(class_obj):
  for name in dir(class_obj):
      if not name.startswith('_'): # private
          attr = class_obj.__dict__[name]
          print(attr, name)
          new_name = getattr(attr, 'new_name', None)
          if new_name:
            print(new_name)
            attr.new_name = None
            setattr(class_obj,new_name, getattr(class_obj, name))
            #delattr(class_obj,name)
  return class_obj

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
        message["time"] = time.time() # Saving absolute time of the message

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
            print(f"Impossible to create the service...backingoff {e}")
            time.sleep(2)
            return self._create_connection()
    

    def on_message_callback(self, channel, method, properties, body):
        binding_key = method.routing_key
        #print(body)
        deserialized = deserialize_message(json.loads(body.decode()))

        self.callback(deserialized)

        #print(f"id:{self.id} received new message")

    def setup(self):
        try:
            channel = self.connection.channel()
            channel.exchange_declare(exchange=config["event"]["exchange"],exchange_type=config["event"]["type"])
            # This method creates or checks a queue
            channel.queue_declare(queue=self.queueName)
            # Binds the queue to the specified exchang
            # TODO improve this, for some reason this is getting exception on BlockingConnection.close(200, 'Normal shutdown') called on closed connection.
            channel.queue_bind(queue=self.queueName,exchange=config["event"]["exchange"],routing_key=self.bindingKey)
            channel.basic_consume(queue=self.queueName, on_message_callback=self.on_message_callback, auto_ack=True)
            print(f'id:{self.id} [*] Waiting for data for ' + self.queueName + '. To exit press CTRL+C')

            try:
                channel.start_consuming()
            except KeyboardInterrupt:
                channel.stop_consuming()

        except Exception as e:
            print("The service suddenly stop....backing off")
            print(f"{e} {traceback.format_exc()} ")
            time.sleep(2) # Backoff and restart
            self.connection = self._create_connection()
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


class Test(Listener):

    def process(self, message):
        print(message)


@subscriber_function(event_type="a")
def receiver(data):
    print(data)


if __name__ == "__main__":
    pass
    #tr = threading.Thread(target=test_subscriber)
    #tr.start()

    #time.sleep(5)
    #publisher = Publisher()
    #for i in range(1):
    #    publisher.publish(EXCHANGE_PROCESS_ID, dict(
    #        event_type="DEPLOYMENT_DONE"
    #    ))

    #tr.join()