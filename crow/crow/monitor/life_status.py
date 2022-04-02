# -*- coding: utf-8 -*-

from crow.events import BC_EXPLORATION_QUEUE
from crow.events import CROW_HEARTBEAT_GENERATED, CROW_HEARTBEAT_QUEUE
from crow.settings import config
import os, sys
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.events import LOG_MESSAGE
from crow.monitor import LOGGING_QUEUE_NAME, LOG_KEY
import platform
import time

@subscriber_function(event_type=CROW_HEARTBEAT_GENERATED)
def general_log(data):
    if data['queueName'] == BC_EXPLORATION_QUEUE:
        print(data['queue_count'])
        print(data['node_id'])
        print(data['id'])
        print()

    # Create the read database

if __name__ == "__main__":


    subscriber = Subscriber(1, CROW_HEARTBEAT_QUEUE, f"crow.heart.*",  config["event"].getint("port"), general_log)
    subscriber.setup()