import pika
import sys
import json
import base64
import threading
import time
from crow.cache import cache

from crow.events import GENERATE_VARIANT_MESSAGE, CROW_HEARTBEAT_GENERATED, CROW_HEARTBEAT_KEY, CROW_HEARTBEAT_QUEUE
from crow.settings import config
import uuid
import base64
import traceback
import ssl
import os
import functools
import threading
import platform


TOBASE64_FIELDS = ["stream", "bc", "ll", "orignal_bc", "original_wasm"]
CERT_DIR = os.path.join(os.path.dirname(os.path.dirname(__file__)), "settings")

# Allow subscriber to have internal state
class Listener:

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
                print(e2)

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
        v = message[k]
        if type(v) is bytes:
            base64_bytes = base64.b64encode(v)
            base64_message = base64_bytes.decode('utf-8')

            base64_message = f"base64:{base64_message}"
            result[k] = base64_message
        else:
            result[k] = v

    return result

def deserialize_message(message):

    result = {}
    for k in message.keys():
        v = message[k]
        if type(v) is str and v.startswith("base64:"):
            v = v[7:]
            base64_bytes = v.encode('utf-8')
            base64_message = base64.b64decode(base64_bytes)
            result[k] = base64_message
        else:
            result[k] = message[k]

    return result

MAX_RETRIES = 10

class Publisher:

    class Wrapper(object):

        def __init__(self, message, key):
            self.message = message
            self.binding_key = key

        #def on_open(self, connection):
        #    connection.channel(on_open_callback=self.on_channel_open)
        def on_delivery_confirmation(self, method_frame):
            confirmation_type = method_frame.method.NAME.split('.')[1].lower()
            if confirmation_type == 'nack':
                print(f'message not routed {self.message["event_type"]}')

        def on_channel_open(self, channel):

            # TODO retry
            retry = MAX_RETRIES

            while retry > 0:
                try:
                    channel.exchange_declare(exchange=config["event"]["exchange"], exchange_type=config["event"]["type"])
                    # Publishes message to the exchange with the given routing key

                    # transform json
                    serialized = serialize_message(self.message)
                    channel.basic_publish(exchange=config["event"]["exchange"],
                                          body=json.dumps(serialized), routing_key=self.binding_key)
                    #channel.confirm_delivery()
                    self.connection.close()

                    break
                except Exception as e:
                    print(f"FAIL to send {e} {traceback.format_exc()}")
                    time.sleep(1)
                    retry -= 1
            # Create new connection
        def publish(self):
            self.create_connection()

        def create_connection(self):

            BROKER_PASS = os.getenv("BROKER_PASS", None)
            BROKER_USER = os.getenv("BROKER_USER", None)

            if BROKER_PASS and BROKER_USER:
                credentials = pika.PlainCredentials(BROKER_USER, BROKER_PASS)
                param = pika.ConnectionParameters(host=config["event"]["host"],
                                                  virtual_host="/",
                                                       port=config["event"].getint("port"),
                                                       credentials=credentials)
            else:
                param = pika.ConnectionParameters(host=config["event"]["host"],
                                                       port=config["event"].getint("port"))

            self.connection = pika.BlockingConnection(param)  # pika.BlockingConnection(param)
            self.on_channel_open(self.connection.channel())
            #self.connection.ioloop.start()

    def publish(self, message, routing_key=""):

        if "event_type" not in message:
            raise Exception("All published messages should contain the 'event_type'")

        message["id"] = f"{uuid.uuid4()}"
        message["time"] = time.time() # Saving absolute time of the message

        wr = Publisher.Wrapper(message, routing_key)
        wr.publish()



class Consumer:
    def __init__(self, id, queueName, bindingKey, port, callback, heartbeat=None, ack_on_receive=False):
        self.callback = callback
        self.should_reconnect = False
        self.was_consuming = False

        self.connection = None
        self.channel = None
        self.closing = False
        self.consumer_tag = None
        self.consuming = False
        self.id = id
        self.queueName = queueName
        self.port = port
        self.key = bindingKey
        self.heartbeat = heartbeat
        self.ack_on_receive = ack_on_receive
        # In production, experiment with higher prefetch values
        # for higher consumer throughput
        self.prefetch_count = config["event"].getint("prefetch_count")
  
    def __del__(self):
        self.close_connection()


    def close_connection(self):

        self.consuming = False
        if self.connection.is_closing or self.connection.is_closed:
            print(f'Connection is closing or already closed')
        else:
            print('Closing connection')
            self.connection.close()


    def on_connection_open(self, _unused_connection):
        """This method is called by pika once the connection to RabbitMQ has
        been established. It passes the handle to the connection object in
        case we need it, but in this case, we'll just mark it unused.
        :param pika.SelectConnection _unused_connection: The connection
        """
        print('Connection opened')
        self.open_channel()

    def on_connection_open_error(self, _unused_connection, err):
        """This method is called by pika if the connection to RabbitMQ
        can't be established.
        :param pika.SelectConnection _unused_connection: The connection
        :param Exception err: The error
        """
        print('Connection open failed: %s %s'%(err, _unused_connection))
        self.reconnect()


    def on_connection_closed(self, _unused_connection, reason):
        """This method is invoked by pika when the connection to RabbitMQ is
        closed unexpectedly. Since it is unexpected, we will reconnect to
        RabbitMQ if it disconnects.
        :param pika.connection.Connection connection: The closed connection obj
        :param Exception reason: exception representing reason for loss of
            connection.
        """
        self.channel = None
        if self.closing:
            self.connection.ioloop.stop()
        else:
            print('Connection closed, reconnect necessary: %s', reason)
            self.reconnect()

    def reconnect(self):
        """Will be invoked if the connection can't be opened or is
        closed. Indicates that a reconnect is necessary then stops the
        ioloop.
        """
        self.should_reconnect = True
        self.stop()

    def open_channel(self):
        """Open a new channel with RabbitMQ by issuing the Channel.Open RPC
        command. When RabbitMQ responds that the channel is open, the
        on_channel_open callback will be invoked by pika.
        """
        print('Creating a new channel')
        self.connection.channel(on_open_callback=self.on_channel_open)

    def on_channel_open(self, channel):
        """This method is invoked by pika when the channel has been opened.
        The channel object is passed in so we can make use of it.
        Since the channel is now open, we'll declare the exchange to use.
        :param pika.channel.Channel channel: The channel object
        """
        print('Channel opened')
        self.channel = channel
        self.add_on_channel_close_callback()
        self.setup_exchange(config["event"]["exchange"])

    def add_on_channel_close_callback(self):
        """This method tells pika to call the on_channel_closed method if
        RabbitMQ unexpectedly closes the channel.
        """
        print('Adding channel close callback')
        self.channel.add_on_close_callback(self.on_channel_closed)

    def on_channel_closed(self, channel, reason):
        """Invoked by pika when RabbitMQ unexpectedly closes the channel.
        Channels are usually closed if you attempt to do something that
        violates the protocol, such as re-declare an exchange or queue with
        different parameters. In this case, we'll close the connection
        to shutdown the object.
        :param pika.channel.Channel: The closed channel
        :param Exception reason: why the channel was closed
        """
        print('Channel %i was closed: %s', channel, reason)
        
        self.close_connection()

    def setup_exchange(self, exchange_name):
        """Setup the exchange on RabbitMQ by invoking the Exchange.Declare RPC
        command. When it is complete, the on_exchange_declareok method will
        be invoked by pika.
        :param str|unicode exchange_name: The name of the exchange to declare
        """
        print('Declaring exchange: %s', exchange_name)
        # Note: using functools.partial is not required, it is demonstrating
        # how arbitrary data can be passed to the callback when it is called
        cb = functools.partial(
            self.on_exchange_declareok, userdata=exchange_name)
        self.channel.exchange_declare(
            exchange=exchange_name,
            exchange_type=config["event"]["type"],

            callback=cb)

    def on_exchange_declareok(self, _unused_frame, userdata):
        """Invoked by pika when RabbitMQ has finished the Exchange.Declare RPC
        command.
        :param pika.Frame.Method unused_frame: Exchange.DeclareOk response frame
        :param str|unicode userdata: Extra user data (exchange name)
        """
        print('Exchange declared: %s', userdata)
        self.setup_queue(self.queueName)

    def setup_queue(self, queue_name):
        """Setup the queue on RabbitMQ by invoking the Queue.Declare RPC
        command. When it is complete, the on_queue_declareok method will
        be invoked by pika.
        :param str|unicode queue_name: The name of the queue to declare.
        """
        print('Declaring queue %s', queue_name)
        cb = functools.partial(self.on_queue_declareok, userdata=queue_name)
        self.channel.queue_declare(queue=queue_name, callback=cb)

    def on_queue_declareok(self, _unused_frame, userdata):
        """Method invoked by pika when the Queue.Declare RPC call made in
        setup_queue has completed. In this method we will bind the queue
        and exchange together with the routing key by issuing the Queue.Bind
        RPC command. When this command is complete, the on_bindok method will
        be invoked by pika.
        :param pika.frame.Method _unused_frame: The Queue.DeclareOk frame
        :param str|unicode userdata: Extra user data (queue name)
        """
        queue_name = userdata
        print('Binding %s to %s with %s', config["event"]["exchange"], queue_name,
                    self.key)
        cb = functools.partial(self.on_bindok, userdata=queue_name)
        self.queue = self.channel.queue_bind(
            queue_name,
            config["event"]["exchange"],
            routing_key=self.key,
            callback=cb)

    def on_bindok(self, _unused_frame, userdata):
        """Invoked by pika when the Queue.Bind method has completed. At this
        point we will set the prefetch count for the channel.
        :param pika.frame.Method _unused_frame: The Queue.BindOk response frame
        :param str|unicode userdata: Extra user data (queue name)
        """
        print('Queue bound: %s', userdata)
        self.set_qos()

    def set_qos(self):
        """This method sets up the consumer prefetch to only be delivered
        one message at a time. The consumer must acknowledge this message
        before RabbitMQ will deliver another one. You should experiment
        with different prefetch values to achieve desired performance.
        """
        self.channel.basic_qos(
            prefetch_count=self.prefetch_count, callback=self.on_basic_qos_ok)

    def on_basic_qos_ok(self, _unused_frame):
        """Invoked by pika when the Basic.QoS method has completed. At this
        point we will start consuming messages by calling start_consuming
        which will invoke the needed RPC commands to start the process.
        :param pika.frame.Method _unused_frame: The Basic.QosOk response frame
        """
        print('QOS set to: %d', self.prefetch_count)
        self.start_consuming()

    def start_consuming(self):
        """This method sets up the consumer by first calling
        add_on_cancel_callback so that the object is notified if RabbitMQ
        cancels the consumer. It then issues the Basic.Consume RPC command
        which returns the consumer tag that is used to uniquely identify the
        consumer with RabbitMQ. We keep the value to use it when we want to
        cancel consuming. The on_message method is passed in as a callback pika
        will invoke when a message is fully received.
        """
        print('Issuing consumer related RPC commands')
        self.add_on_cancel_callback()
        self.consumer_tag = self.channel.basic_consume(
            self.queueName, self.on_message)
        self.was_consuming = True
        self.consuming = True

    def add_on_cancel_callback(self):
        """Add a callback that will be invoked if RabbitMQ cancels the consumer
        for some reason. If RabbitMQ does cancel the consumer,
        on_consumer_cancelled will be invoked by pika.
        """
        print('Adding consumer cancellation callback')
        self.channel.add_on_cancel_callback(self.on_consumer_cancelled)

    def on_consumer_cancelled(self, method_frame):
        """Invoked by pika when RabbitMQ sends a Basic.Cancel for a consumer
        receiving messages.
        :param pika.frame.Method method_frame: The Basic.Cancel frame
        """
        print('Consumer was cancelled remotely, shutting down: %r',
                    method_frame)
        if self.channel:
            self.channel.close()

    def on_message(self, _unused_channel, basic_deliver, properties, body):
        """Invoked by pika when a message is delivered from RabbitMQ. The
        channel is passed for your convenience. The basic_deliver object that
        is passed in carries the exchange, routing key, delivery tag and
        a redelivered flag for the message. The properties passed in is an
        instance of BasicProperties with the message properties and the body
        is the message that was sent.
        :param pika.channel.Channel _unused_channel: The channel object
        :param pika.Spec.Basic.Deliver: basic_deliver method
        :param pika.Spec.BasicProperties: properties
        :param bytes body: The message body
        """
        #print('Received message # %s from %s'%(
        #3            basic_deliver.delivery_tag, properties.app_id))

        if self.ack_on_receive:
            self.acknowledge_message(basic_deliver.delivery_tag)

        try:
            deserialized = deserialize_message(json.loads(body.decode()))
        #    print(deserialized)
            self.callback(deserialized)
        except Exception as e:
            print(f"ERROR {e} {traceback.format_exc()}")
        # print(f"id:{self.id} received new message")
        # This ensure that the message needs to be reprocessed
        if not self.ack_on_receive:
            self.acknowledge_message(basic_deliver.delivery_tag)

    def acknowledge_message(self, delivery_tag):
        """Acknowledge the message delivery from RabbitMQ by sending a
        Basic.Ack RPC method for the delivery tag.
        :param int delivery_tag: The delivery tag from the Basic.Deliver frame
        """
        # print('Acknowledging message %s'%delivery_tag)
        self.channel.basic_ack(delivery_tag, False)

    def stop_consuming(self):
        """Tell RabbitMQ that you would like to stop consuming by sending the
        Basic.Cancel RPC command.
        """
        if self.channel:
            print('Sending a Basic.Cancel RPC command to RabbitMQ')
            cb = functools.partial(
                self.on_cancelok, userdata=self.consumer_tag)
            self.channel.basic_cancel(self.consumer_tag, cb)

    def on_cancelok(self, _unused_frame, userdata):
        """This method is invoked by pika when RabbitMQ acknowledges the
        cancellation of a consumer. At this point we will close the channel.
        This will invoke the on_channel_closed method once the channel has been
        closed, which will in-turn close the connection.
        :param pika.frame.Method _unused_frame: The Basic.CancelOk frame
        :param str|unicode userdata: Extra user data (consumer tag)
        """
        self.consuming = False
        print(
            'RabbitMQ acknowledged the cancellation of the consumer: %s',
            userdata)
        self.close_channel()

    def close_channel(self):
        """Call to close the channel with RabbitMQ cleanly by issuing the
        Channel.Close RPC command.
        """
        print('Closing the channel')
        self.channel.queue_unbind(self.queue)
        self.channel.close()

    def run(self):
        """Run the example consumer by connecting to RabbitMQ and then
        starting the IOLoop to block and allow the SelectConnection to operate.
        """
        self.connection = self.connect()
        self.connection.ioloop.start()


    def connect(self):
        """This method connects to RabbitMQ, returning the connection handle.
        When the connection is established, the on_connection_open method
        will be invoked by pika.
        :rtype: pika.SelectConnection
        """

        BROKER_PASS = os.getenv("BROKER_PASS", None)
        BROKER_USER = os.getenv("BROKER_USER", None)

        if BROKER_PASS and BROKER_USER:

            credentials = pika.PlainCredentials(BROKER_USER, BROKER_PASS)
            parameters = pika.ConnectionParameters(host=config["event"]["host"], port=config["event"].getint("port"),virtual_host="/", heartbeat=self.heartbeat, credentials=credentials)
        else:
            parameters = pika.ConnectionParameters(host=config["event"]["host"], port=config["event"].getint("port"), heartbeat=self.heartbeat)

        return pika.SelectConnection(
            parameters=parameters,
            on_open_callback=self.on_connection_open,
            on_open_error_callback=self.on_connection_open_error,
            on_close_callback=self.on_connection_closed)

    def stop(self):
        """Cleanly shutdown the connection to RabbitMQ by stopping the consumer
        with RabbitMQ. When RabbitMQ confirms the cancellation, on_cancelok
        will be invoked by pika, which will then closing the channel and
        connection. The IOLoop is started again because this method is invoked
        when CTRL-C is pressed raising a KeyboardInterrupt exception. This
        exception stops the IOLoop which needs to be running for pika to
        communicate with RabbitMQ. All of the commands issued prior to starting
        the IOLoop will be buffered but not processed.
        """
        if not self.closing:
            self.closing = True
            print('Stopping')
            if self.consuming:
                self.stop_consuming()
                self.connection.ioloop.start()
            else:
                self.connection.ioloop.stop()
            print('Stopped')



class Subscriber:
    """This is an example consumer that will reconnect if the nested
    ExampleConsumer indicates that a reconnect is necessary.
    """

    def send_consumer(self):
        print("Starting consumer")
        while True:
            try:
                self.cb_sema.acquire()
                # print("Acquiring msg")
                if len(self.queue) > 0:
                    j = self.queue.pop()
                    self.cb(j)
                # TODO, send the internal queue as a message
                # time.sleep(5)
                # print("Releasing msg")
                self.cb_sema.release()
            except KeyboardInterrupt:
                return
            except Exception as e:
                print(e)
                print(traceback.format_exc())

    # Start a self heartbeat publisher
    # This will send pressure over the node, internal queue size etc
    def start_self_heartbeat(self):
        if self.queueName != CROW_HEARTBEAT_QUEUE:
            self.self_publisher = Publisher()
            while True:
                try:
                    self.self_publisher.publish(message=dict(
                            event_type=CROW_HEARTBEAT_GENERATED,
                            queue_count=len(self.queue),
                            node_id = platform.node(),
                            queueName = self.queueName,
                            key = self.key,
                            id=self.id,
                        ), routing_key=CROW_HEARTBEAT_KEY)
                    # Sleep for 5 seconds
                    time.sleep(5) 
                except KeyboardInterrupt:
                    break
                

    def __init__(self, id, queueName, key, port, cb, heartbeat=None, ack_on_receive=True):
        self.id = id
        self.reconnect_delay = 0
        self.queueName = queueName
        self.port = port
        self.key=key
        self.cb = cb
        self.ack_on_receive = ack_on_receive
        self.heartbeat=heartbeat
        
        self.queue_sema = threading.Semaphore()
        self.cb_sema = threading.Semaphore()

        self.queue = []

        # Start the consumer thread
        def enqueue_cb(j):
            self.queue_sema.acquire()
            #print("Acquiring job")
            self.queue.append(j)
            # TODO, send the internal queue as a message
            # print(f"Internal queue size {queueName}-{key} {len(self.queue)}")
            self.queue_sema.release()

        self.queue_thread = threading.Thread(target=self.send_consumer)
        self.queue_thread.start()

        self.heartbeat_thread = threading.Thread(target=self.start_self_heartbeat)
        self.heartbeat_thread.start()

        self.consumer = Consumer(id, queueName, key, port, enqueue_cb, heartbeat=heartbeat, ack_on_receive=ack_on_receive)

    def setup(self):
        while True:
            try:
                self.consumer.run()
            except KeyboardInterrupt:
                self.consumer.stop()
                self.queue_thread.join()
                print("Consume thread stopped")
                break
            self.maybe_reconnect()

    def maybe_reconnect(self):
        if self.consumer.should_reconnect:
            self.consumer.stop()
            reconnect_delay = self.get_reconnect_delay()
            print('Reconnecting to "%s:%s" after %d seconds'%(config["event"]["host"], self.port, reconnect_delay,))
            time.sleep(reconnect_delay)
            self.consumer = Consumer(self.id, self.queueName, self.key, self.port, self.cb, heartbeat=self.heartbeat, ack_on_receive=self.ack_on_receive)

    def get_reconnect_delay(self):
        if self.consumer.was_consuming:
            self.reconnect_delay = 0
        else:
            self.reconnect_delay += 1
        if self.reconnect_delay > 30:
            self.reconnect_delay = 30
        return self.reconnect_delay

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