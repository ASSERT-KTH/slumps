# -*- coding: utf-8 -*-

from crow.settings import config
import os, sys
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.events import LOG_MESSAGE
from crow.monitor import LOGGING_QUEUE_NAME, LOG_KEY

ERROR="ERROR"
WARNING="WARNING"
INFO="INFO"
SUCCESS="SUCCESS"
DEBUG="DEBUG"

OUT_FOLDER = os.environ.get("OUT_FOLDER", "out")


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\u001b[36;1m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

def log(severity, message):

    if severity == ERROR:
        print("%s%s%s" % (bcolors.FAIL, message, bcolors.ENDC))
    elif severity == WARNING:
        print("%s%s%s" % (bcolors.WARNING, message, bcolors.ENDC))
    elif severity == INFO:
        print("%s%s%s" % (bcolors.OKBLUE, message, bcolors.ENDC))
    elif severity == SUCCESS:
        print("%s%s%s" % (bcolors.OKGREEN,message, bcolors.ENDC))
    else:
        print("%s%s%s" % (bcolors.BOLD, message, bcolors.ENDC))

def log2file(severity, message, program_name):

    f = open(f"{OUT_FOLDER}/{program_name}.logs.txt", 'a')
    if severity == ERROR:
        f.write("%s %s\n" % ("[FAIL]", message))
    elif severity == WARNING:
        f.write("%s %s\n" % ("[WARNING]", message))
    elif severity == INFO:
        f.write("%s %s\n" % ("[INFO]", message))
    elif severity == SUCCESS:
        f.write("%s %s\n" % ("[SUCCESS]",message))
    else:
        f.write("%s %s\n" % ("[INFO]", message))

class Logger(object):


    def __init__(self):
        self.indent = 0
        self.disabled = False
        self.p = Publisher()
        self.DEBUG = 0

    def disable(self):
        self.disabled = True

    def enable(self):
        self.disabled = False


    def debug(self, file, message, std=None):
        if self.DEBUG > 3:
            log(DEBUG, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=DEBUG,
            program=file
        ),routing_key=f"{LOG_KEY}.{DEBUG}")

    def error(self,file,  message):
        if self.DEBUG > 1:
            log(ERROR, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=ERROR,
            program=file
        ), routing_key=f"{LOG_KEY}.{ERROR}")


    def warning(self,file, message):
        if self.DEBUG > 1:
            log(WARNING, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=WARNING,
            program=file
        ),routing_key=f"{LOG_KEY}.{WARNING}")


    def info(self,file,  message):
        if self.DEBUG > 0:
            log(INFO, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=INFO,
            program=file
        ),routing_key=f"{LOG_KEY}.{INFO}")


    def success(self,file,  message):

        if self.DEBUG > 0:
            log(SUCCESS, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=SUCCESS,
            program=file
        ),routing_key=f"{LOG_KEY}.{SUCCESS}")



LOGGER = Logger()  # Output debug calls to debug.slumps.log file


@subscriber_function(event_type=LOG_MESSAGE)
def general_log(data):
    k = "exception" if "exception" in data else "message"

    if config["DEFAULT"].getboolean("log2file"):
        log2file(data["severity"], data[k], data["program"] if "program" in data else "general")
    else:
        log(data["severity"], data[k])



if __name__ == "__main__":

    if not os.path.exists(OUT_FOLDER):
        os.mkdir(OUT_FOLDER)
    if not os.path.exists(os.path.join(OUT_FOLDER, "logs")):
        os.mkdir(os.path.join(OUT_FOLDER, "logs"))
    OUT_FOLDER = os.path.join(OUT_FOLDER, "logs")


    subscriber = Subscriber(1, LOGGING_QUEUE_NAME, f"{LOG_KEY}.*",  config["event"].getint("port"), general_log)
    subscriber.setup()