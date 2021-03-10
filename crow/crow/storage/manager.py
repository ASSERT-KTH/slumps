from crow.entrypoints import STORE_KEY
from crow.events import STORE_MESSAGE
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
from crow.settings import config

from crow.monitor.monitor import log_system_exception
from crow.storage import STORAGE_QUEUE_NAME
import os
import hashlib
from crow.monitor.logger import LOGGER
from crow.cache import cache
import sys

OUT_FOLDER = os.environ.get("OUT_FOLDER", "out")
OUT_FOLDER = os.path.join(os.path.dirname(__file__), OUT_FOLDER)
# CHECK FOR MEMORY
# ADD MONGODB storage in another version of the service

CACHE = cache.getcache(True)

def create_path(base_path, path):
    root = base_path

    subfolders = path.split("/")

    for folder in subfolders:
        if not os.path.exists(f"{root}/{folder}"):
            os.mkdir(f"{root}/{folder}")
        root = f"{root}/{folder}"

@log_system_exception()
@subscriber_function(event_type=STORE_MESSAGE)
def subscriber(data):

    global CACHE

    out = "%s/%s"%(OUT_FOLDER, data["program_name"])

    if not os.path.exists(f"{out}"):
        os.mkdir(f"{out}")
    if "path" in data:
        create_path(out, data["path"])
        out = os.path.join(out, data["path"])

    hashvalue = hashlib.sha256(data["stream"]).hexdigest()
    ext = data["file_name"].split(".")[-1]
    key = f"{data['program_name']}:{ext}:{hashvalue}"

    if CACHE.has(key) and config["DEFAULT"].getboolean("remove-duplicates"):
        del data["stream"]
        CACHE.addtoexisting(key, data)
        return

    print(f"SAVING {data['file_name']}")

    LOGGER.warning(data["program_name"], f"New variant {data['file_name']}")

    f = open("%s/%s"%(out, data["file_name"]), 'wb')
    f.write(data["stream"])
    f.close()

    del data["stream"]
    CACHE.init(key, data)



if __name__ == "__main__":

    # Create out folder
    if not os.path.exists(f"{OUT_FOLDER}"):
        os.mkdir(f"{OUT_FOLDER}")

    # SIMPLE Task wait for messages and save the corresponding files
    subscriber = Subscriber(1, STORAGE_QUEUE_NAME, STORE_KEY, config["event"].getint("port"), subscriber)
    subscriber.setup()
