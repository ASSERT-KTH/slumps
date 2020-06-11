import iterators
from crow.settings import config
from crow.utils import getIteratorByName



def test_settings():
    print(config.defaults(), config["souper"]["path"])
    print(config["souper"]["souper"])
    print(config["souper"]["check"])

    method = config["DEFAULT"]["generator-method"]

    func = getattr(iterators, method)

    print(method, func)


def test_subset_generator_1():
    method = config["DEFAULT"]["generator-method"]

    for subset in getIteratorByName(method)([1, 2, 3, 4, 5]):
        print(subset)


def test_onexone():
    for subset in getIteratorByName("onexone")([1, 2, 3, 4, 5]):
        print(subset)


def test_all():
    for subset in getIteratorByName("all")([1, 2, 3, 4, 5]):
        print(subset)


def test_subset_generator_2():
    method = config["DEFAULT"]["generator-method"]
    iter = getIteratorByName(method)([1, 2, 3, 4, 5])

    assert sum(1 for _ in iter) == 2 ** 5 - 1
