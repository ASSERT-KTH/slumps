
from utils import bcolors, DEBUG_FILE

class Logger(object):
    
    def __init__(self, debugToFile = False):
        self.debugToFile = debugToFile
        self.indent = 0

    def enter(self):
        self.indent += 1

    def exit(self):
        self.indent -= 1

    def getIndent(self):
        return "\t"*self.indent

    def debug(self, message, std):
        

        if self.debugToFile:
            DEBUG_FILE.write(message.encode("utf-8"))
            DEBUG_FILE.write(std)
        else:
            print("%s%s%s%s"%(self.getIndent(), bcolors.UNDERLINE, message, bcolors.ENDC))

    def error(self, message):
        print("%s%s%s%s"%(self.getIndent(), bcolors.FAIL, message, bcolors.ENDC))

    def warning(self, message):
        print("%s%s%s%s"%(self.getIndent(), bcolors.WARNING, message, bcolors.ENDC))

    def info(self, message):
        print("%s%s"%(self.getIndent(), message,))

    def success(self, message):
        print("%s%s%s%s"%(self.getIndent(), bcolors.OKGREEN, message, bcolors.ENDC))

LOGGER = Logger(True) # Output debug calls to debug.slumps.log file