# -*- coding: utf-8 -*-

import os

import uuid
import sys
from subprocess import check_output
from subprocess import Popen, PIPE
from settings import config, private

import iterators

from logger import LOGGER
import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import json
import threading
import re
import traceback


BASE_DIR = os.path.dirname(__file__)
RUNTIME_CONFIG = dict(USE_REDIS=False)

OUT_FOLDER = config["DEFAULT"]["outfolder"]

class ContentToTmpFile(object):


    def __init__(self, content=None, name=None, ext=None, persist=False, LOG_LEVEL = 0):
        tmp = createTmpFile(ext) if not name else name

        tmp = ''.join([c for c in tmp])

        if content:
            self.tmpF = open(tmp, "wb")
            self.tmpF.write(content)
            self.tmpF.close()
        else:
            self.tmpF = open(tmp, 'wb')
        self.file = tmp
        self.persist = persist
        self.LOG_LEVEL = LOG_LEVEL


    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_vadl, exc_tb):
        try:
            if self.tmpF:
                self.tmpF.close()
            if not self.persist:
                os.remove(self.file)
        except Exception as e:
            if self.LOG_LEVEL > 1:
                LOGGER.error(self.tmpF, traceback.format_exc())


def updatesettings(argvs):

    SLUMPS_DIR = os.path.dirname(os.path.dirname(os.path.dirname(__file__)))

    print("Slumps dir...%s" % SLUMPS_DIR)
    config["DEFAULT"]["slumpspath"] = SLUMPS_DIR

    with open(f"{BASE_DIR}/settings/config.ini", 'w') as configFile:
        config.write(configFile)
        
    
    platform = ".so" if sys.platform == 'linux' else '.dylib'  # dylib for MacOS

    print("OS...%s" % sys.platform)
    config["souper"]["passName"] = config["souper"]["passName"].split(".")[
        0] + platform

        
    pairs = []
    for index, a in enumerate(argvs):
        if a.startswith("%"):
            if index + 1 < len(argvs) and not argvs[index + 1].startswith("%"):
                pairs.append([a, argvs[index + 1]])
            else:
                raise Exception(
                    "Invalid option %s. Full options line %s" % (a, " ".join(argvs)))

    for pair in pairs:
        processOptionValuePair(pair)

    with open(f"{BASE_DIR}/settings/config.ini", 'w') as configFile:
        config.write(configFile)
        
    OUT_FOLDER = config["DEFAULT"]["outfolder"]

def processOptionValuePair(pair):
    option, value = pair
    option = option[1:]  # Remove the firsst dash
    namespace, key = option.split(".")  # Getting namespace and key

    if not namespace in config:
        print("Available namespace for configuration:")
        for k in config.keys():
            print("\t%s" % k)
        raise Exception("%s namespace not found" % namespace)

    if not key in config[namespace]:
        print("Available keys for namespace %s:" % namespace)
        for k in config[namespace].keys():
            print("\t%s: %s" % (k, config[namespace][k]))
        raise Exception("%s key not found" % key)

    config[namespace][key] = value
    print(namespace, key, value)




def getIteratorByName(name: str):
    return getattr(iterators, name)


def createTmpFile(ext=""):
    r = "%s/%s%s" % (OUT_FOLDER, uuid.uuid4(), ext if ext else "")

    return r


def globalCounter():
    globalCounter.counter += 1
    return globalCounter.counter


globalCounter.counter = 0



def sendReportEmail(subject, content, attachments=[]):
    # Send using gmail
    # try:

    server = smtplib.SMTP_SSL('smtp.gmail.com', 465)
    server.ehlo()

    sent_from = os.environ.get("GUSER", private["gmail"].get("user", None))
    pass_ = os.environ.get("GPASS", private["gmail"].get("pass", None))
    to = os.environ.get("TOUSER", private["gmail"].get("touser", None))

    if sent_from is None or pass_ is None or to is None:
        return

    print(sent_from, pass_)
    server.login(sent_from, pass_)

    msg = MIMEMultipart()

    # storing the senders email address
    msg['From'] = sent_from

    # storing the receivers email address
    msg['To'] = to

    # storing the subject
    msg['Subject'] = subject

    # string to store the body of the mail
    body = content

    for attach in attachments:
        # attach the body with the msg instance

        # open the file to be sent
        filename = attach.split("/")[-1]
        attachment = open(attach, "rb")

        # instance of MIMEBase and named as p
        p = MIMEBase('application', 'octet-stream')

        # To change the payload into encoded form
        p.set_payload(attachment.read())

        # encode into base64
        encoders.encode_base64(p)

        p.add_header('Content-Disposition', "attachment", filename=filename)

        # attach the instance 'p' to instance 'msg'
        msg.attach(p)

    msg.attach(MIMEText(body, 'plain'))

    server.sendmail(sent_from, to, msg.as_string())
    server.close()
    # except Exception as e:

    #print("Error", e.__str__())


def printProgressBar(iteration, total, prefix='', suffix='', decimals=1, length=100, fill='█', printEnd="\r"):
    """
    Call in a loop to create terminal progress bar
    @params:
        iteration   - Required  : current iteration (Int)
        total       - Required  : total iterations (Int)
        prefix      - Optional  : prefix string (Str)
        suffix      - Optional  : suffix string (Str)
        decimals    - Optional  : positive number of decimals in percent complete (Int)
        length      - Optional  : character length of bar (Int)
        fill        - Optional  : bar fill character (Str)
        printEnd    - Optional  : end character (e.g. "\r", "\r\n") (Str)
    """
    percent = ("{0:." + str(decimals) + "f}").format(100 *
                                                     (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix), end=printEnd)
    # Print New Line on Complete
    if iteration == total:
        print()


class Alias:

    
    clang = config["clang"]["path"]
    opt = config["opt"]["path"]

    llvm_as = config["llvm-as"]["path"]

    wasm_ld = config["wasm-ld"]["path"] 
    souper = config["souper"]["souper"]
    souper_check = config["souper"]["check"]
    wasm2wat = config["wabt"]["wasm2wat"]


def processCandidatesMetaOutput(output):
    meta = re.compile(r'\[(.*)/(\d+)\]')
    setRe = re.compile(r"\[SLUMPS-META replacement idx (\d+)\]\n")
    match = meta.search(output)

    total = int(match.group(2))

    # process set
    try:
        resultSet = [int(r) for r in setRe.findall(output)]

        return [resultSet, total]
    except Exception as e:
        return [[], total]


class BreakException(Exception):
    pass
