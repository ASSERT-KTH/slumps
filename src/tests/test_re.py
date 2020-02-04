import re
import os
import utils

BASEDIR = os.path.dirname(__file__)


def test_re():
    input_expected_functions = [
        r"( |\t|\r|\n)+scanf( )*\(",
    ]

    content = open("%s/test_re.c"%BASEDIR, 'r').read()

    print(any(map(lambda x: re.compile(x).search(content), input_expected_functions)))


def test_candidates_parsing():
    
    print(utils.processCandidatesMetaOutput("[/65]"))
    print(utils.processCandidatesMetaOutput("[,0,1,2,3,10/65]"))