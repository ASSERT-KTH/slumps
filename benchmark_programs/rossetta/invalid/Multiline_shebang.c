der|C}}==
<pre>#!/bin/bash
sed -n -e '7,$p' < "$0" | /usr/bin/gcc -x c -o "$0.$$.out" -
$0.$$.out "$0" "$@"
STATUS=$?
rm $0.$$.out
exit $STATUS
#include <stdio.h>

int main(int argc, char **argv)
{
  int i;
  for (i = 0; i < argc; i++)
    printf("argv[%d] -> %s\n", i, argv[i]);
  return 0;
}</pre>

Test runs:

<pre>$ ./cmulshbang.c
argv[0] -> ./cmulshbang.c.4062.out
argv[1] -> ./cmulshbang.c
$ ./cmulshbang.c 1
argv[0] -> ./cmulshbang.c.4071.out
argv[1] -> ./cmulshbang.c
argv[2] -> 1
$ ./cmulshbang.c 1 2
argv[0] -> ./cmulshbang.c.4080.out
argv[1] -> ./cmulshbang.c
argv[2] -> 1
argv[3] -> 2</pre>

'''Student exercise:''' use a stable filename for the executable, e.g. <code>"$0.out"</code>.  Do not remove it, and only recompile it if the script's timestamp is newer than that of the executable./* <stdin>:33:1: warning: empty character constant [-Winvalid-pp-token]
'''Student exercise:''' use a stable filename for the executable, e.g. <code>"$0.out"</code>.  Do not remove it, and only recompile it if the script's timestamp is newer than that of the executable.
^
<stdin>:33:22: warning: empty character constant [-Winvalid-pp-token]
'''Student exercise:''' use a stable filename for the executable, e.g. <code>"$0.out"</code>.  Do not remove it, and only recompile it if the script's timestamp is newer than that of the executable.
                     ^
<stdin>:33:149: warning: missing terminating ' character [-Winvalid-pp-token]
'''Student exercise:''' use a stable filename for the executable, e.g. <code>"$0.out"</code>.  Do not remove it, and only recompile it if the script's timestamp is newer than that of the executable.
                                                                                                                                                    ^
3 warnings generated.
 */