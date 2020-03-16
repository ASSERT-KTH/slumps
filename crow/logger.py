# -*- coding: utf-8 -*-

from utils import bcolors, getlogfilename


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

    def error(self,file,  message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.FAIL, message, bcolors.ENDC))

    def warning(self,file, message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.WARNING, message, bcolors.ENDC))

    def info(self,file,  message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.OKBLUE, message, bcolors.ENDC))

    def success(self,file,  message):
        f = open(getlogfilename(file), 'a+')
        f.write(message.__str__() + "\n")
        print("%s%s%s%s" % (self.getIndent(), bcolors.OKGREEN, message, bcolors.ENDC))


LOGGER = Logger(True)  # Output debug calls to debug.slumps.log file
