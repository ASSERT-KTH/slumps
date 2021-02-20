# -*- coding: utf-8 -*-

from crow.settings import config
import os, sys
from crow.ansi_ui import SCREEN
from crow.events.event_manager import Publisher, Subscriber, subscriber_function
from crow.events import LOG_MESSAGE
from crow.monitor import LOGGING_QUEUE_NAME

ERROR="ERROR"
WARNING="WARNING"
INFO="INFO"
SUCCESS="SUCCESS"
DEBUG="DEBUG"


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

class Logger(object):


    def __init__(self):
        self.indent = 0
        self.disabled = False
        self.p = Publisher()
        self.DEBUG = 2

    def disable(self):
        self.disabled = True

    def enable(self):
        self.disabled = False


    def debug(self, file, message, std=None):
        if self.DEBUG > 3:
            log(SUCCESS, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=DEBUG,
            program=file
        ),
            routing_key="")

    def error(self,file,  message):
        if self.DEBUG > 1:
            log(SUCCESS, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=ERROR,
            program=file
        ),
            routing_key="")


    def warning(self,file, message):
        if self.DEBUG > 1:
            log(SUCCESS, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=WARNING,
            program=file
        ),
            routing_key="")


    def info(self,file,  message):
        if self.DEBUG > 0:
            log(SUCCESS, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=INFO,
            program=file
        ),
            routing_key="")


    def success(self,file,  message):

        if self.DEBUG > 0:
            log(SUCCESS, message)

        self.p.publish(message=dict(
            event_type=LOG_MESSAGE,
            message=message,
            severity=SUCCESS,
            program=file
        ),
            routing_key="")



LOGGER = Logger()  # Output debug calls to debug.slumps.log file


@subscriber_function(event_type=LOG_MESSAGE)
def general_log(data):
    k = "exception" if "exception" in data else "message"
    log(data["severity"], data[k])



if __name__ == "__main__":

    subscriber = Subscriber(1, LOGGING_QUEUE_NAME, "*", config["event"].getint("port"), general_log)
    subscriber.setup()