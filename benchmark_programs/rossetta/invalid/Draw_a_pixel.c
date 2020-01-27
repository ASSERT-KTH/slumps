
#include<graphics.h>

int main()
{
	initwindow(320,240,"Red Pixel");
	
	putpixel(100,100,RED);
	
	getch();
	
	return 0;
}
/* <stdin>:2:9: fatal error: 'graphics.h' file not found
#include<graphics.h>
        ^~~~~~~~~~~~
1 error generated.
 */