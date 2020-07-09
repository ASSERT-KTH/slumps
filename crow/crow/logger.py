# -*- coding: utf-8 -*-

from settings import config, private
import os, sys


def getlogfilename(program_name):

    program_name = os.path.basename(program_name)
    
    if not os.path.exists("%s/crow/logs" % (config["DEFAULT"]["slumpspath"],)):
        os.mkdir("%s/crow/logs" % (config["DEFAULT"]["slumpspath"],))
    
    return "%s/crow/logs/%s.slumps.log" % (config["DEFAULT"]["slumpspath"], program_name)


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\u001b[36;1m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'

class Logger(object):

    def __init__(self, debugToFile=False):
        self.debugToFile = debugToFile
        self.indent = 0

    def enter(self):
        self.indent += 1

    def exit(self):
        self.indent -= 1

    def getIndent(self):
        return "\t" * self.indent

    def debug(self, file, message, std=None):

        try:
            message = message.decode()
        except (UnicodeDecodeError, AttributeError):
            pass

        try:
            std = std.decode()
        except (UnicodeDecodeError, AttributeError):
            pass


        if self.debugToFile:
            f = open(getlogfilename(file), 'a+')
            f.write(message)
            if std:
                f.write(std.__str__())
        else:
            print("%s%s%s%s" % (self.getIndent(), bcolors.UNDERLINE, message, bcolors.ENDC))
            sys.stdout.flush()

    def error(self,file,  message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.FAIL, message, bcolors.ENDC))
        sys.stdout.flush()

    def warning(self,file, message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.WARNING, message, bcolors.ENDC))
        sys.stdout.flush()

    def info(self,file,  message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.OKBLUE, message, bcolors.ENDC))
        sys.stdout.flush()

    def success(self,file,  message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.OKGREEN, message, bcolors.ENDC))
        sys.stdout.flush()


LOGGER = Logger(True)  # Output debug calls to debug.slumps.log file
