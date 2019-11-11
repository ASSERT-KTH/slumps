import utils

def test_subset_generator_1():
    for subset in utils.getSubsetIterator(set([1, 2, 3, 4, 5]), 1):
        print(subset)


def test_subset_generator_2():
    iter = utils.getSubsetIterator(set([1, 2, 3, 4, 5]), 1)

    assert sum(1 for _ in iter) == 2**5 - 1