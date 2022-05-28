
from crow.commands.stages import CToLLStage
from crow.entrypoints import LOG_KEY, GENERATE_BC_KEY, STORE_KEY, LL_KEY
from crow.events import LOG_MESSAGE, LL2BC_MESSAGE, STORE_MESSAGE
from crow.events.event_manager import Publisher
from crow.monitor.logger import ERROR
import random

import sys

from crow.monitor.monitor import log_system_exception
from crow.settings import config

@log_system_exception()
def c2ll(program_name, content):
    
    ctoll = CToLLStage(program_name)
    file = "/tmp/cf.c"
    fd = open(file, 'w')
    fd.write(content)
    fd.close()

    publisher = Publisher()
    ll1 = ctoll(file)

    publisher.publish(message=dict(
        event_type=LL2BC_MESSAGE,
        ll=ll1,
        program_name=program_name,
    ), routing_key=LL_KEY)

    if config["DEFAULT"].getboolean("keep-ll-files"):
        publisher.publish(message=dict(
            event_type=STORE_MESSAGE,
            stream=ll1,
            program_name=f"{program_name}",
            file_name=f"{program_name}.ll",
            path="ll"
        ), routing_key=STORE_KEY)

def main(filename, content):
    c2ll(filename, content)

if __name__ == "__main__":
    if len(sys.argv) > 1:
        content = open(sys.argv[1], 'r')
        content = content.read()
        main(sys.argv[1], content)