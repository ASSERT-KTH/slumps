import re


def test_re():
    input_expected_functions = [
        r"( |\t|\r|\n)+scanf( )*\(",
    ]

    content = open("test_re.c", 'r').read()

    print(any(map(lambda x: re.compile(x).search(content), input_expected_functions)))