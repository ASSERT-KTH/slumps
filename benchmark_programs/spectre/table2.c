

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
    int index = argc%2;
    int (*funcs[2])(int)  = {&f1, &f2};
    
    return (*funcs[index])(argc);
}