#ifndef _MILLER_RABIN_H_
#define _MILLER_RABIN_H
#include <gmp.h>
bool miller_rabin_test(mpz_t n, int j);
#endif/* <stdin>:1:9: warning: '_MILLER_RABIN_H_' is used as a header guard here, followed by #define of a different macro [-Wheader-guard]
#ifndef _MILLER_RABIN_H_
        ^~~~~~~~~~~~~~~~
<stdin>:2:9: note: '_MILLER_RABIN_H' is defined here; did you mean '_MILLER_RABIN_H_'?
#define _MILLER_RABIN_H
        ^~~~~~~~~~~~~~~
        _MILLER_RABIN_H_
1 warning generated.
 */