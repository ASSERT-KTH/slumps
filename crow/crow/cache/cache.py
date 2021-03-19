
from crow.settings import config
import redis
import os
import json


class Cache(object):

    def has(self, key):
        raise NotImplemented("has is not implemented")

    def get(self, key):
        raise NotImplemented("get is not implemented")

    def set(self, key, val):
        raise NotImplemented("set is not implemented")

    def addtoexisting(self, key, val):
        if self.has(key):
            previous = self.get(key)

            #print(previous)
            newval = self.add(previous, val)
            #print(newval)
            serialized = self._serialize(newval)

            self.set(key, serialized)

    def init(self, key, val):
        serialized = self._serialize([val])
        self.set(key, serialized)

    def _desearialize(self, stream):
        return json.loads(stream.decode())

    def _serialize(self, stream):
        return json.dumps(stream).encode()

    # The value of the key is an array of common values
    def add(self, values, newone):
        values.append(newone)
        return values

class DictCache(Cache):

    def __init__(self):
        self.CACHE = {}

    def has(self, key):
        return key in self.CACHE

    def get(self, key):
        if key in self.CACHE:
            return  self.CACHE[key]
        return None

    def _serialize(self, stream):
        return stream

    def _desearialize(self, stream):
        return stream

    def set(self, key, value):
        self.CACHE[key] = value

    def init(self, key, val):
        self.CACHE[key] = [val]


class RedisCache(Cache):

    def __init__(self, db, password):

        db = int(db)
        if db >= 0 and password:
            self.connection = redis.Redis(
                host=config["cache"]["redis-host"],
                port=config["cache"].getint("redis-port"),
                password=password,
                db=db
            )
        else:
            self.connection = redis.Redis(
                host=config["cache"]["redis-host"],
                port=config["cache"].getint("redis-port")
            )

    def has(self, key):
        return self.connection.get(key) is not None

    def get(self, key):

        r = self.connection.get(key)
        if r:
            return self._desearialize(r)

        return r

    def set(self, key, val):
        return self.connection.set(key, val)



def getcache(use_redis):

    if use_redis:
        print("REDIS cache")
        return RedisCache(os.getenv("REDIS_DB", 0), os.getenv("REDIS_PASS", ""))
    else:
        print("Native dict cache")
        return DictCache()


if __name__ == '__main__':
    cache = RedisCache(0, "mypassword")
    cache.init("11", 1)
    cache.addtoexisting("11", 2)

    print(cache.get("12"))
    print(cache.get("11"))
    print(cache.has("11"), cache.has("12"))

    # native

    native = DictCache()

    native.init("11", 1)
    native.addtoexisting("11", 2)

    print(native.get("12"))
    print(native.get("11"))
    print(native.has("11"), native.has("12"))