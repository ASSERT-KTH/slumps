"""
Read db module. This module will write the events and will aggregate the data for easy reading. 
Written data will be like current jobs, number of variants, replacement applied in variant
"""
from peewee import *
import os
DBNAME="readdb.sqlite"

readdb = SqliteDatabase(DBNAME)

class SubscriberStats(Model):
    id = CharField(primary_key = True)
    node_name = CharField()
    queue_size = IntegerField()

    class Meta:
        database = readdb

class Module(Model):
    hsh = CharField(primary_key = True)
    name = CharField()

    # Metadata fields, refreshed on event read
    class Meta:
        database = readdb

class Function(Model):
    hsh = CharField(primary_key = True)
    module = ForeignKeyField(Module, backref="functions")
    status = CharField()
    real_name = CharField()
    name = CharField()

    # Metadata fields, refreshed on event read

    class Meta:
        database = readdb

class Variant(Model):
    id = CharField(primary_key = True)
    original = ForeignKeyField(Function, backref="variants")

    file_name = CharField()
    name = CharField()

    # Metadata fields, refreshed on event read

    # Create a parser from this field to get original and 
    # replacement
    # rawreplacement = CharField()

    class Meta:
        database = readdb

class BCFile(Model):
    id = CharField(primary_key = True)
    original = ForeignKeyField(Variant, backref="bcfiles")
    # path = CharField()
    name = CharField()
    hsh = CharField()

    class Meta:
        database = readdb

class WasmFile(Model):
    id = CharField(primary_key = True)
    original = ForeignKeyField(Variant, backref="wasmfiles")
    # path = CharField()
    hsh = CharField()
    name = CharField()
    
    class Meta:
        database = readdb


class Projection:

    @staticmethod
    def get_projection(m, field= lambda x: x.name):

        # print("Constructing projection")
        name = field(m)
        chunks = name.split(".")
        # print("Chunks", chunks)
        proj = Projection()
        proj.name = name
        proj.level = "o" # The original has level o
        proj.workerid = "main"
        proj.blockid = "all"
        proj.function_name = "original"
        proj.module_name = "pending"
        proj.function_hash = "pending"
        proj.variant_name = "pending"


        if len(chunks) > 1 and "v" in chunks[1]:
            proj.workerid = chunks[0]
            proj.level = chunks[1][:chunks[1].index("v")]

            if len(chunks) > 2:
                proj.blockid = chunks[2]
                proj.function_name = chunks[3]
                proj.module_name = chunks[3].split("_")[0]
                proj.function_hash = chunks[3].split("_")[1]
                proj.variant_name = chunks[3]

        return proj        

class WatFile(Model):
    id = CharField(primary_key = True)
    original = ForeignKeyField(WasmFile, backref="wats")
    # path = CharField()
    hsh = CharField()
    name = CharField()
    
    class Meta:
        database = readdb

def init_db():
    if os.path.exists(DBNAME):
        os.remove(DBNAME)

    readdb.create_tables([SubscriberStats, Function, Variant, BCFile, WasmFile, WatFile, Module])

def connect_db():
    readdb.connect()