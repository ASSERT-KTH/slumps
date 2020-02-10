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
    
    print(utils.processCandidatesMetaOutput("""; Listing all replacements for binomial
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for catalan1
; Using solver: Z3 + external cache + internal cache

; Replacing "  %cmp.i = icmp ugt i64 %sub.i, %conv1"
; from ""
; with "i1 false" in:
"%0:i32 = var
%1:i64 = sext %0 (hasExternalUses)
%2:i32 = shlnsw %0, 1:i32
%3:i64 = sext %2 (hasExternalUses)
%4:i64 = subnsw %3, %1 (hasExternalUses)
%5:i1 = ult %1, %4
cand %5 0:i1
"
; with "i1 false"

[SLUMPS-META replacement idx 12]

; Listing all replacements for catalan2
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for catalan3
; Using solver: Z3 + external cache + internal cache

; Listing all replacements for main
; Using solver: Z3 + external cache + internal cache
Total of 1 replacements done on this module
Total of 1 replacements candidates on this module
[/103]"""))
    print(utils.processCandidatesMetaOutput("[0/65]"))