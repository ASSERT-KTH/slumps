# -*- coding: utf-8 -*-

import os
import subprocess
import uuid
import sys
from crow.settings import config, reload
from crow.commands import stages
import re
import traceback
import time


def is_wasm_file(stream):
    return stream[:4] == b'\x00asm' 

def is_bc_file(stream):
    try:
        tmp = open("/tmp/tmp.bc", "wb")
        tmp.write(stream)
        tmp.close()
        # If it can compile
        
        finalObjCreator = stages.ObjtoWASM("/tmp/tmp.bc", debug=True)
        finalObjCreator.check(args=[
            "/tmp/tmp.wasm",
             "/tmp/tmp.bc"
        ])

        return True
    except Exception as e:
        print(e, traceback.format_exc())
        return False

def is_c_file(stream):
    try:
        tmp = open("/tmp/tmp.c", "wb")
        tmp.write(stream)
        tmp.close()
        # If it can compile
        args = "/tmp/tmp.c"
        args = config["clang"]["command"] % (args,)
        args = config["clang"]["path"] + " " + args
        print(args)
        subprocess.check_output(args.split(" "))
        return True
    except Exception as e:
        print(e, traceback.format_exc())
        return False 
