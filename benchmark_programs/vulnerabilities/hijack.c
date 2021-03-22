#include <stdio.h>


void default_func() {
    printf("Pointer overwrite failed\n");
}
void hijacked_func() {
    printf("Pointer overwrite SUCCEEDED!\n");
}
void func_ptr_overwrite(char *str) {
    void *func_ptr;
    void *func2_ptr;
    char buf[50];
    func_ptr = default_func;
    func2_ptr = hijacked_func;
    printf("Function number for default_func : %x\n",(int)default_func);
    printf("Function number for hijacked_func : %x\n",(int)hijacked_func);
    printf("Address of buf: %x\n",(int)buf);
    printf("Address of func_ptr: %x\n",(int)&func_ptr);
    sprintf(buf,"The entered string is: %s",str);
    printf("%s\n",buf);
    ((void (*)(void))func_ptr)(); //execute function of pointer
}


int main(){
    func_ptr_overwrite("AAAA");
    func_ptr_overwrite("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA7");

    return 0;
}