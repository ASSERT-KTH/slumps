
#include<stdbool.h>
#include<string.h>
#include<stdio.h>

typedef struct{
    int year, month, day;
}date;

date extractDate(char* str){
    return (date){.year = 1000 * (str[0]-'0') + 100 * (str[1]-'0') + 10 * (str[2]-'0') + (str[3]-'0'), .month = 10*(str[5]-'0') + (str[6]-'0'), .day = 10*(str[8]-'0') + (str[9]-'0')};
}

bool isValidDate(char* str){
    date newDate;
    
    if(strlen(str)!=10 && str[4]!='-' && str[7]!='-'){
        return false;
    }

    newDate = extractDate(str);

    if(newDate.year<=0 || newDate.month<=0 || newDate.day<=0 || newDate.month>12 || (newDate.month==2 && newDate.day>29) || 
      ((newDate.month==1 || newDate.month==3 || newDate.month==5 || newDate.month==7 || newDate.month==8 || newDate.month==10 || newDate.month==12) && newDate.day>31) || 
      newDate.day>30 || (newDate.year%4==0 && newDate.month==2 && newDate.month>28)){
          return false;
      }

    return true;
}

int diffDays(date date1,date date2){
    int days1, days2;
    
    date1.month = (date1.month + 9)%12;
    date1.year = date1.year - date1.month/10;

    date2.month = (date2.month + 9)%12;
    date2.year = date2.year - date2.month/10;

    days1 = 365*date1.year + date1.year/4 - date1.year/100 + date1.year/400 + (date1.month*306 + 5)/10 + ( date1.day - 1 );
    days2 = 365*date2.year + date2.year/4 - date2.year/100 + date2.year/400 + (date2.month*306 + 5)/10 + ( date2.day - 1 );

    return days2 - days1;
}

int main(int argc,char** argv)
{
    if(argc!=3){
        return printf("Usage : %s <yyyy-mm-dd> <yyyy-mm-dd>",argv[0]);
    }

    if(isValidDate(argv[1])&&isValidDate(argv[2]) == false){
        return printf("Dates are invalid.\n");
    }

    printf("Days Difference : %d\n", diffDays(extractDate(argv[1]),extractDate(argv[2])));

    return 0;
}
