
/*Abhishek Ghosh, 15th September 2018*/

#include<graphics.h>

void vibratingRectangles(int winWidth,int winHeight,int leastLength,int leastWidth,int num, int msec)
{
	int color = 1,i,x = winWidth/2, y = winHeight/2;
	
	while(!kbhit()){
		setcolor(color++);
		for(i=num;i>0;i--){
			rectangle(x - i*leastLength,y - i*leastWidth,x + i*leastLength,y + i*leastWidth);
			delay(msec);
		}

		if(color>MAXCOLORS){
			color = 1;
		}
	}
}

int main()
{
	initwindow(1000,1000,"Vibrating Rectangles...");
	
	vibratingRectangles(1000,1000,30,15,20,500);
	
	closegraph();
	
	return 0;
}
/* <stdin>:4:9: fatal error: 'graphics.h' file not found
#include<graphics.h>
        ^~~~~~~~~~~~
1 error generated.
 */