import iterators
import utils


def test_settings():
    print(utils.config.defaults(), utils.config["souper"]["path"])
    print(utils.config["souper"]["souper"])
    print(utils.config["souper"]["check"])

    method = utils.config["DEFAULT"]["generator-method"]

    func = getattr(iterators, method)

    print(method, func)


def test_subset_generator_1():
    method = utils.config["DEFAULT"]["generator-method"]

    for subset in utils.getIteratorByName(method)([1, 2, 3, 4, 5]):
        print(subset)


def test_onexone():
    for subset in utils.getIteratorByName("onexone")([1, 2, 3, 4, 5]):
        print(subset)


def test_all():
    for subset in utils.getIteratorByName("all")([1, 2, 3, 4, 5]):
        print(subset)


def test_subset_generator_2():
    method = utils.config["DEFAULT"]["generator-method"]
    iter = utils.getIteratorByName(method)([1, 2, 3, 4, 5])

    assert sum(1 for _ in iter) == 2 ** 5 - 1
