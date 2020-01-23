
#include<stdio.h>

int main()
{
	char str[10];
	
	ready: do{
		printf("\nMachine is READY. (D)eposit or (Q)uit :");
		scanf("%s",str);
	}while(!(str[0]!='D'||str[0]!='d'||str[0]!='q'||str[0]!='Q'));
	
	if(str[0]=='q'||str[0]=='Q')
		goto quit;
	goto waiting;
	
	waiting: do{
		printf("(S)elect product or choose to (R)efund :");
		scanf("%s",str);
	}while(!(str[0]!='s'||str[0]!='S'||str[0]!='r'||str[0]!='R'));
	
	if(str[0]=='s'||str[0]=='S'){
		printf("Dispensing product...");
		goto dispense;
	}
	
	else{
		printf("Please collect refund.");
		goto ready;
	}
	
	dispense: do{
		printf("\nPlease (C)ollect product. :");
		scanf("%s",str);
	}while(!(str[0]!='c'||str[0]!='C'));
	
	goto ready;
	
	quit: printf("Thank you, shutting down now.");
	
	return 0;
}
