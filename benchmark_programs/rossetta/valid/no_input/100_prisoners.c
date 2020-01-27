
#include<stdbool.h>
#include<stdlib.h>
#include<stdio.h>
#include<time.h>

#define LIBERTY false
#define DEATH true

typedef struct{
	int id;
	int cardNum;
	bool hasBeenOpened;
}drawer;

typedef struct{
	int id;
	bool foundCard;
}prisoner;

drawer *drawerSet;
prisoner *prisonerGang;

void initialize(int prisoners){
	int i,j,card;
	bool unique;

	drawerSet = (drawer*)malloc(prisoners * sizeof(drawer));
	prisonerGang = (prisoner*)malloc(prisoners * sizeof(prisoner));

	for(i=0;i<prisoners;i++){
		prisonerGang[i] = (prisoner){.id = i+1, .foundCard = false};

		card = rand()%prisoners + 1;

		if(i==0)
			drawerSet[i] = (drawer){.id = i+1, .cardNum = card, .hasBeenOpened = false};
		else{
			unique = false;
			while(unique==false){
				for(j=0;j<i;j++){
					if(drawerSet[j].cardNum == card){
						card = rand()%prisoners + 1;
						break;
					}
				}
				if(j==i){
					unique = true;
				}
			}
			drawerSet[i] = (drawer){.id = i+1, .cardNum = card, .hasBeenOpened = false};
		}
	}
}

void closeAllDrawers(int prisoners){
	int i;
	for(i=0;i<prisoners;i++)
		drawerSet[i].hasBeenOpened = false;
}

bool libertyOrDeathAtRandom(int prisoners,int chances){
	int i,j,chosenDrawer;
	
	for(i=0;i<prisoners;i++){
		for(j=0;j<chances;j++){
			do{
				chosenDrawer = rand()%prisoners;
			}while(drawerSet[chosenDrawer].hasBeenOpened==true);
			if(drawerSet[chosenDrawer].cardNum == prisonerGang[i].id){
				prisonerGang[i].foundCard = true;
				break;
			}
			drawerSet[chosenDrawer].hasBeenOpened = true;
		}
		closeAllDrawers(prisoners);
		if(prisonerGang[i].foundCard == false)
			return DEATH;
	}

	return LIBERTY;
}

bool libertyOrDeathPlanned(int prisoners,int chances){
	int i,j,chosenDrawer;
	for(i=0;i<prisoners;i++){
		chosenDrawer = rand()%prisoners;
		for(j=1;j<chances;j++){
			if(drawerSet[chosenDrawer].cardNum == prisonerGang[i].id){
				prisonerGang[i].foundCard = true;
				break;
			}
			if(chosenDrawer+1 == drawerSet[chosenDrawer].id){
				do{
                    chosenDrawer = rand()%prisoners;
				}while(drawerSet[chosenDrawer].hasBeenOpened==true);
			}
			else{
				chosenDrawer = drawerSet[chosenDrawer].cardNum - 1;
			}
			drawerSet[chosenDrawer].hasBeenOpened = true;
		}
		closeAllDrawers(prisoners);
		if(prisonerGang[i].foundCard == false)
			return DEATH;
	}

	return LIBERTY;
}

int main(int argc,char** argv)
{
	int prisoners, chances;
	unsigned long long int trials,i,count = 0;
        char* end;

	if(argc!=4)
		return printf("Usage : %s <Number of prisoners> <Number of chances> <Number of trials>",argv[0]);

	prisoners = atoi(argv[1]);
	chances = atoi(argv[2]);
	trials = strtoull(argv[3],&end,10);

	srand(time(NULL));
	
	printf("Running random trials...");
	for(i=0;i<trials;i+=1L){
		initialize(prisoners);

		count += libertyOrDeathAtRandom(prisoners,chances)==DEATH?0:1;
	}

	printf("\n\nGames Played : %llu\nGames Won : %llu\nChances : %lf % \n\n",trials,count,(100.0*count)/trials);

        count = 0;

	printf("Running strategic trials...");
	for(i=0;i<trials;i+=1L){
		initialize(prisoners);

		count += libertyOrDeathPlanned(prisoners,chances)==DEATH?0:1;
	}

	printf("\n\nGames Played : %llu\nGames Won : %llu\nChances : %lf % \n\n",trials,count,(100.0*count)/trials);
	return 0;
}
