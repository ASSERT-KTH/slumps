"""
Read db module. This module will write the events and will aggregate the data for easy reading. 
Written data will be like current jobs, number of variants, replacement applied in variant
"""
from pstats import StatsProfile
from peewee import *
import peewee
from sqlite3 import Connection
import os
import inspect

DBNAME="readdb.sqlite"

readdb = SqliteDatabase(DBNAME)

class SubscriberStats(Model):
    id = CharField(primary_key = True)
    node_name = CharField()
    queue_size = IntegerField()
    cpu_usage = FloatField()
    memory_usage = CharField()

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
            proj.variant_name = chunks[1]
            
            if len(chunks) > 3:
                try:
                    proj.blockid = chunks[2]
                    proj.function_name = chunks[4]
                    proj.module_name = chunks[4].split("_")[0]
                    proj.function_hash = chunks[4].split("_")[1]
                except Exception as e:
                    print(e, "Projection, chunks", chunks)
                    

        return proj        

class WatFile(Model):
    id = CharField(primary_key = True)
    original = ForeignKeyField(WasmFile, backref="wats")
    # path = CharField()
    hsh = CharField()
    name = CharField()
    
    class Meta:
        database = readdb






# readdb.create_tables(models)

def connect_db():
    pass
    # readdb.connect()


def reconnect_db():
    pass
    #readdb.close()
    # readdb.connect()

'''
for cls in globals().values():
    if type(cls) == peewee.Model:
        try:
            cls.create_table()
        except peewee.OperationalError as e:
            print(e)
'''

def init():

    SubscriberStats.create_table()
    Module.create_table()
    Function.create_table()
    Variant.create_table()
    BCFile.create_table()
    WasmFile.create_table()
    WatFile.create_table()
    WatFile.create_table()