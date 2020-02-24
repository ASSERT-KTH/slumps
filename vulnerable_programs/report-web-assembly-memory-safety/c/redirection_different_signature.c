#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

/*
Unfortunately, the function signature check is not a water-proof way of mitigating against function pointer
overwrites. For example, when the C (or other language) datatypes are converted to the corresponding
Wasm datatypes, type confusion can occur, which can let us bypass the function signature check.
For example, a C void pointer (void *) and an integer (int) both translate to the i32 datatype in Wasm.
This issue is not limited to lower-level languages such as C.

This can be taken even further. If you use Emscripten for compiling to Wasm, control-flow can be
handled using a function named emscripten_set_main_loop_arg(). This function only takes two
pointers: one pointer to the function to execute and another pointer to the arguments. Notice that even if
the function to execute takes several arguments, there is still just one pointer, so in that case it needs to
point to a struct or similar. When having only two pointers, the function signature check is going to match
for all functions. We may be able to overwrite both the function pointer and the arguments without Wasm
bailing out.
*/

typedef struct person_info {
 char name[20];
 int age;
} person_info;

typedef struct car_info {
 unsigned char nbr_cars;
 char brand1[10];
} car_info;

void print_person_info(void *person_info_ptr) {
 struct person_info *info = (struct person_info *) person_info_ptr;
 printf("In print_person_info\n");
 printf("Person name: %s, person age: %d\n",info->name,info->age);
 emscripten_cancel_main_loop();
}

void print_car_info(void *car_info_ptr) {
 car_info *info = (car_info *) car_info_ptr;
 printf("In print_car_info\n");
 printf("Number of cars: %d, first brand: %s\n",info->nbr_cars,info->brand1);
 emscripten_cancel_main_loop();
}

void get_func_pointer(char *name, void **func_ptr) {
 if (strcmp(name,"S3cr3tP@ssw0rd") == 0) {
    *func_ptr = print_car_info;
 } else {
    *func_ptr = print_person_info;
 }
}

void func_ptr_overwrite2(char *name, char *age) {
 void *func_ptr;
 struct person_info info;
 char buf[50];
 get_func_pointer(name,&func_ptr);
 sprintf(&(info.name[0]),"%s",name);
 info.age = (char) atoi(age);
 sprintf(buf,"The entered name is: %s",name);
 emscripten_set_main_loop_arg(func_ptr, (void *)&info, 1, 0);
}