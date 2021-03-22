

int f1(int a){
    if (a < 0)
        return a;

    return 10;
}

int f2(int b){
    if (b > 0)
        return b;

    return 100;
    
}

int main(int argc, char *argv[]){
    
    int (*func1)(int) = &f1;

    if(argc > 0)
        func1 = &f2;

    
    return (*func1)(argc);
}