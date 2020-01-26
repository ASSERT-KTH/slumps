#include <stdio.h>
#include <string.h>
#include <zlib.h>
 
int main()
{
	const char *s = "The quick brown fox jumps over the lazy dog";
	printf("%lX\n", crc32(0, (const void*)s, strlen(s)));

	return 0;
}/* <stdin>:3:10: fatal error: 'zlib.h' file not found
#include <zlib.h>
         ^~~~~~~~
1 error generated.
 */