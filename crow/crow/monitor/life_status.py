# -*- coding: utf-8 -*-

from crow.events import BC_EXPLORATION_QUEUE
from crow.events import CROW_HEARTBEAT_GENERATED, CROW_HEARTBEAT_QUEUE, GENERATED_WAT_FILE, WAT_QUEUE, CROW_HEARTBEAT_NEW_WASM , CROW_HEARTBEAT_NEW_PROGRAM, CROW_HEARTBEAT_NEW_VARIANT, CROW_HEARTBEAT_NEW_WAT, CROW_HEARTBEAT_NEW_FUNCTION
from crow.settings import config
from crow.monitor.minpeewee.readdb import init_db, SubscriberStats, Module, Function, Variant, BCFile, WasmFile, WatFile
import os, sys
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.events import LOG_MESSAGE
from crow.monitor import LOGGING_QUEUE_NAME, LOG_KEY
import platform
import time

@subscriber_function(event_type="*")
def general_log(data):
    tpe = data['event_type'
    ]
    if tpe == CROW_HEARTBEAT_GENERATED:
        # Set the subscriber stats
        #print("Saving stats for subscriber")
        try:
            stat = SubscriberStats.get(id=data['worker_id'])
            stat.queue_size = data['queue_count']
            stat.save()
        except SubscriberStats.DoesNotExist:
            stats = SubscriberStats.create(
                id = data['worker_id'], node_name=data['node_id'], queue_size=data['queue_count']
                )
    elif tpe == CROW_HEARTBEAT_NEW_WAT:
        # Save wat file using parent
        wat = WatFile.create(
                id = data['id'],
                name = data['file_name'],
                hsh = data['hsh'],
                original = data['parent']
                )
    elif tpe == CROW_HEARTBEAT_NEW_WASM:
        wasm = WasmFile.create(
                id = data['id'],
                name = data['file_name'],
                hsh = data['hsh'],
                original = data['parent']
                )
    elif tpe == CROW_HEARTBEAT_NEW_PROGRAM:
        # Save new program module
        try:
            program = Module.get(hsh=data['hsh'])
        except Module.DoesNotExist:
            program = Module.create(
                hsh = data['hsh'], name=data['program_name']
                )

    elif tpe == CROW_HEARTBEAT_NEW_FUNCTION:
        try:
            func = Function.get(hsh=data['hsh'])
            func.status = data['status']
            func.save()

        except Function.DoesNotExist:
            func = Function.create(
                hsh = data['hsh'], name=data['name'],
                module=data['original'],
                status=data['status'],
                real_name=data['realname']
                )
        # Comes from split, this is a new module function
        # Save it
        pass
    elif tpe == CROW_HEARTBEAT_NEW_VARIANT:
        # CROW created a new variant
        var = Variant.create(
                name=data['name'],
                id=data['id'],
                original=data['parent'],
                file_name=data['file_name'],
            )
        bcfile = BCFile.create(
                name=data['name'],
                id=data['id'],
                hsh=data['hsh'],
                original=var
        )
    else:
        raise Exception(f"Unknown tpe {tpe}")
    # Create the read database

    # TODO, do the aggeration of all the data

if __name__ == "__main__":

    # Initialize read db
    init_db()

    subscriber = Subscriber("heart_reader", CROW_HEARTBEAT_QUEUE, f"crow.heart.*",  config["event"].getint("port"), general_log)
    subscriber.setup()