import sys
import redis
from multiprocessing import Pool
import subprocess

import json
import os
import time
import platform
import hashlib
import re
import base64 as b64
import functools
from neo4j import GraphDatabase

from multiprocessing import Pool

INVOLVED_PATHS = {
    'sodium_bin2base64': [
        "b64_byte_to_char.244",
        "b64_byte_to_urlsafe_char.243"
    ]
}

class Query:

    def __init__(self, uri, user, password):
        self.driver = GraphDatabase.driver(uri, auth=(user, password))

    def close(self):
        self.driver.close()

    def get_spanning(self, function_name):
        with self.driver.session() as session:
            greeting = session.write_transaction(self._get_static_spanning,function_name )
        
    
    @staticmethod
    def _get_static_spanning(tx, functionName,):
        
        result = tx.run(
            f"MATCH p=(start {{name: '{functionName}'}})-[r:ST*..]->(k) return p")

        print([r for r in result])



def process():
    host = os.getenv("NEO_HOST", "bolt://localhost:7687")
    user = os.getenv("NEO_USER", "neo4j")
    pass_ = os.getenv("NEO_PASS", "test")


    greeter = Query(host, user, pass_)

    for k in INVOLVED_PATHS:
        greeter.get_spanning(k)
    greeter.close()


if __name__ == "__main__":
    process()

