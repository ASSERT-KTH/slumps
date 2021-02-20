from crow.events import LOG_MESSAGE, GENERATED_BC_VARIANT, GENERATED_WASM_VARIANT, LIFE_STATUS_QUEUE
from crow.monitor.logger import ERROR
from crow.events.event_manager import Subscriber, subscriber_function, Publisher
import traceback
from crow.settings import config
import matplotlib.pyplot as plt
import hashlib


hashes_BC = set()
hashes_WM = set()
COUNTS_BC = 1
COUNTS_WM = 1
TIMES_BC = []
TIMES_WM = []


def draw_update(countBC, countWM, uniqueBC, uniqueWM, TIMES_BC, TIMES_WM):
    plt.clf()
    #fig, axs = plt.subplots(ncols=2)

    #ax1, ax2 = axs
    #ax1.set_title("U/T %s" % (uniqueBC / countBC,))
    #ax1.plot(range(len(TIMES_BC)), [t[0] for t in TIMES_BC], '--o', label="Total %s" % (COUNTS_BC,))
    #ax1.plot(range(len(TIMES_BC)), [t[1] for t in TIMES_BC], '--o', label="Unique %s" % (uniqueBC,))


    #ax2.set_title("U/T %s" % (uniqueWM / countWM,))
    #ax2.plot(range(len(TIMES_WM)), [t[0] for t in TIMES_WM], '--o', label="Total %s" % (COUNTS_WM,))
    #ax2.plot(range(len(TIMES_WM)), [t[1] for t in TIMES_WM], '--o', label="Unique %s" % (uniqueWM,))

    plt.title("U/T %s" % (uniqueBC / countBC,))
    plt.plot(range(len(TIMES_BC)), [t[0] for t in TIMES_BC], '--o', label="Total %s" % (countBC,))
    plt.plot(range(len(TIMES_BC)), [t[1] for t in TIMES_BC], '--o', label="Unique %s" % (uniqueBC,))

    plt.legend()
    plt.pause(0.001)
    plt.draw()



@subscriber_function(event_type="*")
def general_log(data):

    global hashes_BC
    global hashes_BC
    global COUNTS_WM
    global COUNTS_BC
    if data["event_type"] == GENERATED_BC_VARIANT:
        COUNTS_BC += 1
        hashvalue = hashlib.sha256(data["bc"]).hexdigest()
        hashes_BC.add(hashvalue)
        TIMES_BC.append([COUNTS_BC, len(hashes_BC)])
        draw_update(COUNTS_BC, COUNTS_WM, len(hashes_BC), len(hashes_WM), TIMES_BC, TIMES_WM)

    elif data["event_type"] == GENERATED_WASM_VARIANT:
        COUNTS_WM += 1
        hashvalue = hashlib.sha256(data["stream"]).hexdigest()
        hashes_WM.add(hashvalue)
        TIMES_WM.append([COUNTS_WM, len(hashes_WM)])


        draw_update(COUNTS_BC, COUNTS_WM, len(hashes_BC), len(hashes_WM), TIMES_BC, TIMES_WM)

if __name__ == "__main__":
    subscriber = Subscriber(1, LIFE_STATUS_QUEUE, "*", config["event"].getint("port"), general_log)
    subscriber.setup()