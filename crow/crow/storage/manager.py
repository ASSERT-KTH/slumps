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
import base64
import sys
import random

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
def subscriber_func(data):

    global CACHE

    OUT_FOLDER = os.environ.get("OUT_FOLDER", "out")
    OUT_FOLDER = os.path.join(os.path.dirname(__file__), OUT_FOLDER)

    out = "%s/%s"%(OUT_FOLDER, data["program_name"])

    if not os.path.exists(f"{out}"):
        os.mkdir(f"{out}")
    if "path" in data:
        create_path(out, data["path"])
        out = os.path.join(out, data["path"])

    hashvalue = hashlib.md5(data["stream"]).hexdigest()
    ext = data["file_name"].split(".")[-1]
    key = f"{data['program_name']}:{ext}:{hashvalue}"

    if CACHE.has(key) and config["DEFAULT"].getboolean("remove-duplicates"):
        del data["stream"]
        CACHE.addtoexisting(key, data)
        print(f"Same variant {data['file_name']}")
        return

    print(f"SAVING {data['file_name']}")

    LOGGER.warning(data["program_name"], f"New variant {data['file_name']}")

    f = open("%s/%s"%(out, data["file_name"]), 'wb')
    f.write(data["stream"])
    f.close()

    # saving also the binary in redis
    data["stream"] = base64.b64encode(data["stream"]).decode("utf-8")
    CACHE.init(key, data)

def main():
    # Create out folder

    OUT_FOLDER = os.environ.get("OUT_FOLDER", "out")
    OUT_FOLDER = os.path.join(os.path.dirname(__file__), OUT_FOLDER)

    if not os.path.exists(f"{OUT_FOLDER}"):
        os.mkdir(f"{OUT_FOLDER}")
    id = f"storage-{random.randint(0, 2000)}"
    # SIMPLE Task wait for messages and save the corresponding files
    subscriber = Subscriber(id, STORAGE_QUEUE_NAME, STORE_KEY, config["event"].getint("port"), subscriber_func)
    subscriber.setup()

if __name__ == "__main__":
    main()
