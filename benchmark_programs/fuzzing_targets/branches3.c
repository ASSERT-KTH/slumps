#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int a(int a, int b){

	if(a > 10)
	{
		printf("a");

		if(b > a){
			printf("b > a\n");
		}
		if(b > 100){
			printf("wait ... b > 100\n");
		}
	}
	else{
		printf("No condition for a\n");

		if( b > 10000){
			printf("Yet b > 1000\n");
		}
	}

	return 0;
}

int main(){
	a(100, 100);
	return 0;
}
