
/*Abhishek Ghosh, 14th September 2018*/

#include<graphics.h>
#include<math.h>

#define pi M_PI

void sunflower(int winWidth, int winHeight, double diskRatio, int iter){
	double factor = .5 + sqrt(1.25),r,theta;
	double x = winWidth/2.0, y = winHeight/2.0;
	double maxRad = pow(iter,factor)/iter;
	
	int i;
	
	setbkcolor(LIGHTBLUE);
	
	for(i=0;i<=iter;i++){
		r = pow(i,factor)/iter;
		
		r/maxRad < diskRatio?setcolor(BLACK):setcolor(YELLOW);
		
		theta = 2*pi*factor*i;
		circle(x + r*sin(theta), y + r*cos(theta), 10 * i/(1.0*iter));
	}
}

int main()
{
	initwindow(1000,1000,"Sunflower...");
	
	sunflower(1000,1000,0.5,3000);
	
	getch();
	
	closegraph();
	
	return 0;
}
/* <stdin>:4:9: fatal error: 'graphics.h' file not found
#include<graphics.h>
        ^~~~~~~~~~~~
1 error generated.
 */