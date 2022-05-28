import threading
import argparse
from crow.monitor.minpeewee.readdb import DBNAME
from crow.events import SPAWN_COMMAND, SPAWN_QUEUE
from crow.events import CROW_HEARTBEAT_QUEUE
from crow.events.event_manager import Subscriber,subscriber_function

from crow.utils import updatesettings
from crow.monitor import life_status, dashboard
from crow.storage import manager as storagemanager
from crow.monitor import logger
from crow.settings import config

# Entrypoints
from crow.entrypoints import wasm2wat, bc2wasm, bc2candidates, fromll, split

import sys
import os
import time
import traceback


@subscriber_function(event_type=SPAWN_COMMAND)
def spawnnewworker(data):
    print(data)
    if "workername" in data:

        if "bc2wasm" in data['workername']:
            print("Spawning a bc2wasm worker")
            bc2wasm.main()

        elif "wasm2wat" in data['workername']:
            print("Spawning a converter worker")
            wasm2wat.main()

        elif "storage" in data['workername']:
            print("Spawning a storage worker")
            storagemanager.main()

        elif "explorer" in data['workername']:
            print("Spawning a storage worker")
            bc2candidates.main()

        elif "extractor" in data['workername']:
            print("Spawning a extractor worker")
            bc2candidates.main()


def launch_spawner():
    
    subscriber = Subscriber("spawner", SPAWN_QUEUE, f"crow.spawn",  config["event"].getint("port"), spawnnewworker)
    subscriber.setup()

if __name__ == '__main__':

    # read from arguments and read legacy way
    rs = []
    notrs = []
    i = 0
    while i < len(sys.argv[1:]):
        arg = sys.argv[i]
        if arg.startswith("%"):
            rs.append(arg)
            rs.append(sys.argv[i + 1])
            i += 2
        else:
            notrs.append(arg)
            i += 1
    print(rs, notrs)
    sys.argv = [sys.argv[0]] + notrs

    parser = argparse.ArgumentParser(description='CROW cli tool.')

    parser.add_argument('--redis-host', metavar='rh', type=str,  default="127.0.0.1", help='Redis host address')

    parser.add_argument('--redis-port', metavar='rp', type=str,   default="1010", help='Redis host port')

    parser.add_argument('--redis-db', metavar='rd', type=str,   default="0", help='Redis db')

    parser.add_argument('--redis-pass', metavar='rs', type=str,   default=os.environ.get("REDIS_PASS", ""), help='Redis pass')
    
    parser.add_argument('--event-host', metavar='eh', type=str,   default="127.0.0.1", help='Broker host')

    parser.add_argument('--event-port', metavar='ep', type=str,   default="5672", help='Broker port')

    parser.add_argument('--dashboard-host', metavar='dh', type=str,   default="127.0.0.1", help='Dashboard host')

    parser.add_argument('--dashboard-port', metavar='dp', type=str,   default="5000", help='Dashboard port')

    # Debug in threading gets an error :)

    parser.add_argument('--dashboard-debug', dest="dashboard_debug", default=False,  action=argparse.BooleanOptionalAction)
    
    parser.add_argument('--dashboard', default=True, action=argparse.BooleanOptionalAction)

    parser.add_argument('--is-spawner', metavar='sp', type=bool,   default=False, help='Launch CROW as an spawner process')
    
    # Entrypoints
    parser.add_argument('--no-wasm2wat', metavar='now2w', type=int,   default=1, help='Number of wasm 2 wat workers')

    parser.add_argument('--no-bc2wasm', metavar='now2w', type=int,   default=1, help='Number of bc 2 wasm')

    parser.add_argument('--no-explorers', metavar='now2w', type=int,   default=1, help='Number of explorers')

    parser.add_argument('--no-llparsers', metavar='now2w', type=int,   default=1, help='Number of ll parsers')

    parser.add_argument('--no-splitworkers', metavar='now2w', type=int,   default=1, help='Number of split workers')


    args = parser.parse_args()

    print(args)
    updatesettings([
        "%cache.redis-host",
        args.redis_host,
        "%cache.redis-port",
        args.redis_port,
        "%event.host",
        args.event_host,
        "%event.port",
        args.event_port,
    ] + rs)



    threads = []
    # listener to spawn is not specified, then run a thread as a standalone CROW
    if args.is_spawner:
        launch_spawner()
    else:
        # Create a new one
        if os.path.exists(DBNAME):
            print("Removing database")
            os.remove(DBNAME)
            from crow.monitor.minpeewee.readdb import init # to create the db
            init()
            time.sleep(10)

        print("Launching life status")
        lifestatus_thread = threading.Thread(target=life_status.main)
        lifestatus_thread.start()
        threads.append(lifestatus_thread)

        
    
        print("Launching storage manager")
        storage_thread = threading.Thread(target=storagemanager.main, )
        storage_thread.start()
        threads.append(storage_thread)    

        print("Launching logger")
        logger_thread = threading.Thread(target=logger.main, )
        logger_thread.start()
        threads.append(logger_thread)


        print("Launching workers wasm2wat")
        for _ in range(args.no_wasm2wat):
            worker = threading.Thread(target=wasm2wat.main, )
            worker.start()
            threads.append(worker)
        
        print("Launching bc2wasm")
        for _ in range(args.no_bc2wasm):
            worker = threading.Thread(target=bc2wasm.main, )
            worker.start()
            threads.append(worker)


        print("Launching explorers")
        for _ in range(args.no_explorers):
            worker = threading.Thread(target=bc2candidates.main, )
            worker.start()
            threads.append(worker)


        print("Launching workers fromll ")
        for _ in range(args.no_llparsers):
            worker = threading.Thread(target=fromll.main, )
            worker.start()
            threads.append(worker)


        print("Launching workers fromll ")
        for _ in range(args.no_splitworkers):
            worker = threading.Thread(target=split.main, )
            worker.start()
            threads.append(worker)

    time.sleep(2)

    if args.dashboard:
        print("Launching dashboard monitor")
        if not args.dashboard_debug:
            dashboard_thread = threading.Thread(target=dashboard.main, args=(
                args.redis_host,
                args.redis_port,
                args.redis_db,
                args.redis_pass,
                "out",
                args.dashboard_host,
                args.dashboard_port,
                False
            ))
            dashboard_thread.start()
            threads.append(dashboard_thread)

    for th in threads:
        th.join()