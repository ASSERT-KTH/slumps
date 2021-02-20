
from crow.commands.stages import LLToBC
from crow.events import LOG_MESSAGE, C2LL_MESSAGE, LL2BC_MESSAGE, BC2Candidates_MESSAGE, STORE_MESSAGE
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.logger import ERROR
from crow.settings import config

import sys
from crow.utils import printProgressBar, createTmpFile, getIteratorByName, \
    ContentToTmpFile, BreakException, RUNTIME_CONFIG, updatesettings, NOW

from crow.monitor.logger import log_system_exception
from crow.storage import STORAGE_QUEUE_NAME
import os

OUT_FOLDER = os.environ.get("OUT_FOLDER", "out")

@log_system_exception()
@subscriber_function(event_type=STORE_MESSAGE)
def subscriber(data):


    out = "%s/%s"%(OUT_FOLDER, data["program_name"])

    if not os.path.exists(f"{out}"):
        os.mkdir(f"{out}")

    f = open("%s/%s"%(out , data["file_name"]), 'wb')
    f.write(data["stream"])
    f.close()

    print("Saving %s/%s"%(out , data["file_name"]))



if __name__ == "__main__":

    # Create out folder
    if not os.path.exists(f"{OUT_FOLDER}"):
        os.mkdir(f"{OUT_FOLDER}")

    # SIMPLE Task wait for messages and save the corresponding files
    key = config["event"]["process-id-exploration"]
    subscriber = Subscriber(1, STORAGE_QUEUE_NAME, key, config["event"].getint("port"), subscriber)
    subscriber.setup()
