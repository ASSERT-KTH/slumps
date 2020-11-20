#include <stdio.h>
#include <stdlib.h>
#include <limits.h>

int a(int a){

	if(a > 10)
	{
		printf("a");

		if(a > 100){
			printf("Crashing branch 3\n");
			exit(12);
		}

	}
	else{
		printf("Crashing branch 1\n");
		exit(1);
	}

	return 0;
}

int main(){
	a(100);
	return 0;
}