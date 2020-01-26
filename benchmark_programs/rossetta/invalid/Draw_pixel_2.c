
#include<graphics.h>
#include<stdlib.h>
#include<time.h>

int main()
{
	srand(time(NULL));
	
	initwindow(640,480,"Yellow Random Pixel");
	
	putpixel(rand()%640,rand()%480,YELLOW);
	
	getch();
	
	return 0;
}
/* <stdin>:2:9: fatal error: 'graphics.h' file not found
#include<graphics.h>
        ^~~~~~~~~~~~
1 error generated.
 */