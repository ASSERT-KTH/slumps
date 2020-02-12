# -*- coding: utf-8 -*-

import os
import configparser
import uuid
import iterators
import sys
from subprocess import check_output
from subprocess import Popen, PIPE

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders
import json
import requests
import threading
import re

config = configparser.ConfigParser(interpolation=configparser.ExtendedInterpolation())
config.read("settings/config.ini")

RUNTIME_CONFIG = dict(USE_REDIS=False)


def getlogfilename(program_name):
    return "%s/src/logs/%s.slumps.log" % (config["DEFAULT"]["slumpspath"], program_name)


class ContentToTmpFile(object):

    def __init__(self, content=None, name=None, ext=None):

        tmp = createTmpFile(ext) if not name else name

        if content:
            self.tmpF = open(tmp, "wb")
            self.tmpF.write(content)
            self.tmpF.close()
        else:
            self.tmpF = open(tmp, 'wb')

        self.file = tmp

    def __enter__(self):
        return self

    def __exit__(self, exc_type, exc_val, exc_tb):
        try:
            if self.tmpF:
                self.tmpF.close()
            os.remove(self.file)
        except Exception as e:
            print(e)
            pass


def updatesettings(argvs):
    
    if not os.path.exists("settings/.slumps"):
        print("Setting up slumps for the first time...")
        open("settings/.slumps", 'w').write("SLUMPs them all!")

        SLUMPS_DIR = os.path.abspath(os.path.dirname(os.path.dirname(__file__)))

        print("Slumps dir...%s" % SLUMPS_DIR)
        config["DEFAULT"]["slumpspath"] = SLUMPS_DIR

        platform = ".so" if sys.platform == 'linux' else '.dylib'  # dylib for MacOS
        print("OS...%s" % sys.platform)
        config["souper"]["passName"] = config["souper"]["passName"].split(".")[0] + platform

        # WAS-ld binary

        # Read available binaries
        bins = check_output('compgen -c', shell=True, executable='/bin/bash').splitlines()

        wasm_bins = list(filter(lambda x: x.startswith("wasm-ld"), map(lambda x: x.decode("utf-8"), bins)))
        emcc = list(filter(lambda x: x.startswith("emcc"), map(lambda x: x.decode("utf-8"), bins)))

        if len(wasm_bins) == 0:
            raise Exception("WASM linker not found. Please install it (apt-get install lld-<version> for ubuntu)")

        wasm_ld = wasm_bins[0]
        if len(wasm_bins) > 1:
            print("Multiple WASM linkers. Choose one, take into account the version of llvm built with Souper:")

            for i, b in enumerate(wasm_bins):
                print("%s -  %s" % (i + 1, b))

            option = int(input("Option: "))
            wasm_ld = wasm_bins[option - 1]

        config["wasm-ld"]["path"] = wasm_ld

        if len(emcc) == 0:
            print("No Emscripten bins found. This can be harmful for SLUMPs")
        else:
            with ContentToTmpFile(name="setting.c", content=b'int main(){return 0;}') as tmpC:

                # launch twice in case of first initialization
                emcc = Popen(('emcc -v %s -o -' % tmpC.file).split(" "), stdout=PIPE, stderr=PIPE, stdin=PIPE)
                emcc, err = emcc.communicate()

                # real call
                emcc = Popen(('emcc -v %s -o -' % tmpC.file).split(" "), stdout=PIPE, stderr=PIPE, stdin=PIPE)
                emcc, err = emcc.communicate()

                words = err.decode("utf-8").split(" ")

                print(words)

                includes = []
                for w in words:
                    if w.startswith("-isystem"):
                        includes.append(w)

                config["clang"]["includes"] = " ".join(includes)

        with open("settings/config.ini", 'w') as configFile:
            config.write(configFile)
    pairs = []
    for index, a in enumerate(argvs):
        if a.startswith("-"):
            if index + 1 < len(argvs) and not argvs[index + 1].startswith("-"):
                pairs.append([a, argvs[index + 1]])
            else:
                raise Exception("Invalid option %s. Full options line %s"%(a, " ".join(argvs)))

    for pair in pairs:
        processOptionValuePair(pair)
    
    with open("settings/config.ini", 'w') as configFile:
        config.write(configFile)

def processOptionValuePair(pair):
    option, value = pair
    option = option[1:] # Remove the firsst dash
    namespace, key = option.split(".") # Getting namespace and key

    if not namespace in config:
        print("Available namespace for configuration:")
        for k in config.keys():
            print("\t%s"%k)
        raise Exception("%s namespace not found"%namespace)
    
    if not key in config[namespace]:
        print("Available keys for namespace %s:"%namespace)
        for k in config[namespace].keys():
            print("\t%s: %s"%(k, config[namespace][k]))
        raise Exception("%s key not found"%key)

    config[namespace][key] = value
    print(namespace, key, value)



OUT_FOLDER = config["DEFAULT"]["outfolder"]


def getIteratorByName(name: str):
    return getattr(iterators, name)


def createTmpFile(ext=""):
    return "%s/%s%s" % (OUT_FOLDER, uuid.uuid4(), ext)


def globalCounter():
    globalCounter.counter += 1
    return globalCounter.counter


globalCounter.counter = 0

private = configparser.ConfigParser(interpolation=configparser.ExtendedInterpolation())
private.read("settings/private.ini")



def make_github_issue(title, body=None, assignee=None, milestone=None,closed=None, labels=None):

    USERNAME = os.environ.get('GITHUB_USER', private["github"].get("user", None))
    TOKEN = os.environ.get('GITHUB_TOKEN', private["github"].get("token", None))
    REPO_NAME = os.environ.get('REPO_NAME', private["github"].get("repo_name", None))

    if USERNAME is None or TOKEN is None or REPO_NAME is None:
        return

    # The repository to add this issue to
    REPO_OWNER = USERNAME

    # Create an issue on github.com using the given parameters
    # Url to create issues via POST

    url = 'https://api.github.com/repos/%s/%s/import/issues' % (REPO_OWNER, REPO_NAME)

    # Headers
    headers = {
        "Authorization": "token %s" % TOKEN,
        "Accept": "application/vnd.github.golden-comet-preview+json"
    }

    # Create our issue
    data = {'issue': {'title': title,
                      'body': body,
                      'milestone': milestone,
                      'labels': labels}}

    payload = json.dumps(data)

    # Add the issue to our repository
    response = requests.request("POST", url, data=payload, headers=headers)
    if response.status_code == 202:
        print('Successfully created Issue "%s"' % title)
    else:
        print('Could not create Issue "%s"' % title)
        print('Response:', response.content)



def sendReportEmail(subject, content, attachments = []):
    # Send using gmail
    #try:


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
    #except Exception as e:

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
    percent = ("{0:." + str(decimals) + "f}").format(100 * (iteration / float(total)))
    filledLength = int(length * iteration // total)
    bar = fill * filledLength + '-' * (length - filledLength)
    print('\r%s |%s| %s%% %s' % (prefix, bar, percent, suffix), end=printEnd)
    # Print New Line on Complete
    if iteration == total:
        print()


class bcolors:
    HEADER = '\033[95m'
    OKBLUE = '\033[94m'
    OKGREEN = '\033[92m'
    WARNING = '\u001b[36;1m'
    FAIL = '\033[91m'
    ENDC = '\033[0m'
    BOLD = '\033[1m'
    UNDERLINE = '\033[4m'


class Alias:
    clang = config["clang"]["path"]
    opt = config["opt"]["path"]

    # llc = "%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,)
    # lli = "%s/souper/third_party/llvm/Release/bin/lli"%(BASE_DIR,)
    llvm_as = config["llvm-as"]["path"]
    # "%s/souper/third_party/llvm/Release/bin/llvm-as"%(BASE_DIR,)
    # llc = "/usr/local/opt/llvm/bin/llc" #"%s/souper/third_party/llvm/Release/bin/llc"%(BASE_DIR,) # /usr/local/opt/llvm/bin/wasm-ld

    wasm_ld = config["wasm-ld"][
        "path"]  # os.environ.get("WASM_LD", "/usr/local/opt/llvm/bin/wasm-ld")  #"/usr/bin/wasm-ld-8" # /usr/local/opt/llvm/bin/wasm-ld
    souper = config["souper"]["souper"]
    souper_check = config["souper"]["check"]
    # souper2llvm = "%s/souper/build/souper2llvm"%(BASE_DIR,)
    wasm2wat = config["wabt"]["wasm2wat"]
    # libsouperPass_so = "../../souper/build/libsouperPass.so"
    # z3 = "%s/souper/third_party/z3/build/z3"%(BASE_DIR,)

def processCandidatesMetaOutput(output):
    meta = re.compile(r'\[(.*)/(\d+)\]')
    setRe = re.compile(r"\[SLUMPS-META replacement idx (\d+)\]\n")

    match = meta.search(output)
    
    total = int(match.group(2))
    # process set 
    try:
        resultSet = [ int(r) for r in setRe.findall(output) ]

        return [resultSet, total]
    except Exception as e:
        return [[], total]

class BreakException(Exception):
    pass

