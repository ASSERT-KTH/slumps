
from crow.commands.stages import LLToBC
from crow.events import LOG_MESSAGE, C2LL_MESSAGE, LL2BC_MESSAGE, BC2Candidates_MESSAGE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.logger import ERROR
from crow.settings import config

import sys
from crow.utils import printProgressBar, createTmpFile, getIteratorByName, \
    ContentToTmpFile, BreakException, RUNTIME_CONFIG, updatesettings, NOW

from crow.monitor.logger import log_system_exception

@log_system_exception()
def ll2bc(ll1, program_name):

    lltobc = LLToBC(program_name, debug=False)
    bc = lltobc(std=ll1.encode())

    publisher = Publisher()

    publisher.publish(message=dict(
        event_type=BC2Candidates_MESSAGE,
        bc=bc.decode(errors="ignore"),
        program_name=program_name
    ), routing_key="")



@log_system_exception()
@subscriber_function(event_type=LL2BC_MESSAGE)
def subscriber(data):
    ll2bc(data["ll"], data["program_name"])


if __name__ == "__main__":

    #updatesettings(sys.argv[2:-1])
    #f = sys.argv[-1]

    if len(sys.argv) == 1:
        key = config["event"]["process-id-exploration"]
        subscriber = Subscriber(1, config["event"]["queue-name"], key, config["event"].getint("port"), subscriber)
        subscriber.setup()
        # Start a subscriber listening for LL2BC message
    else:
        # Convert and send a LL to BC message
        program_name = sys.argv[1]
        ll2bc(sys.stdin.read(), program_name)