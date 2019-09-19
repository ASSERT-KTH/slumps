#include <stdio.h>
#include <string.h>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

/*
You used to be able to get arbitrary code execution with format string bugs via the ‘%n’ modifier.
Nowadays you typically only get information disclosure since many C compilers disallow the use of the
%n modifier because of its security implications. The situation is the same with Wasm – it doesn’t
appear to be possible to get arbitrary code execution, but information disclosure is indeed possible.
Below we have a very simple function that has a vulnerable call to the printf() function (marked in
bold). By entering a suitable input, we can leak out the value of the variable ‘secret_password’:
*/
void EMSCRIPTEN_KEEPALIVE format_string_bug(char *str) {
 char secret_password[] = "MyP@ssw0rd!!";
 printf("you entered = ");
 printf(str);
 printf("\n");
}