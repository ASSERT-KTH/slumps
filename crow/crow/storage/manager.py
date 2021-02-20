from crow.events import STORE_MESSAGE
from crow.events.event_manager import Subscriber, subscriber_function
from crow.settings import config

from crow.monitor.monitor import log_system_exception
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
