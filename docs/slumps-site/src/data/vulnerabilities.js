
const memory = [
    {
        "name": "Function hijacking",
        "description": "Wasm does not protect against overwriting function pointers. As a mitigation against function pointer overwrites, Wasm checks the signature of the called function when making an indirect function call, and checks that the signature matches what is expected. The function signature is made up of the number and types of arguments to the function. This means that an exploit cannot transfer execution to a function having the wrong signature.",
        "link": "",
        "code": `
#include 
#include 

#ifdef __EMSCRIPTEN__
#include 
#endif

void EMSCRIPTEN_KEEPALIVE default_func() {
  printf(\"Pointer overwrite failed\\n\");
}
void EMSCRIPTEN_KEEPALIVE hijacked_func() {
  printf(\"Pointer overwrite SUCCEEDED!\\n\");
}
void EMSCRIPTEN_KEEPALIVE func_ptr_overwrite(char *str) {
  void *func_ptr;
  char buf[50];
  func_ptr = default_func;
  printf(\"Function number for default_func : %x\\n\",(int)default_func);
  printf(\"Function number for hijacked_func : %x\\n\",(int)hijacked_func);
  printf(\"Address of buf: %x\\n\",(int)buf);
  printf(\"Address of func_ptr: %x\\n\",(int)&func_ptr);
  sprintf(buf,\"The entered string is: %s\",str);
  printf(\"%s\\n\",buf);
  ((void (*)(void))func_ptr)(); //execute function of pointer
}
        `
    },
    {
        "name": "Function hijacking 2",
        "description": `Unfortunately, the function signature check is not a water-proof way of mitigating against function pointer overwrites. For example, when the C (or other language) datatypes are converted to the corresponding Wasm datatypes, type confusion can occur, which can let us bypass the function signature check. For example, a C void pointer (void *) and an integer (int) both translate to the i32 datatype in Wasm. This issue is not limited to lower-level languages such as C. </br>

        This can be taken even further. If you use Emscripten for compiling to Wasm, control-flow can be handled using a function named <strong>emscripten_set_main_loop_arg()</strong>. This function only takes two pointers: one pointer to the function to execute and another pointer to the arguments. Notice that even if the function to execute takes several arguments, there is still just one pointer, so in that case it needs to point to a struct or similar. When having only two pointers, the function signature check is going to match for all functions. We may be able to overwrite both the function pointer and the arguments without Wasm bailing out.
        `,
        "link": "",
        "code": `
#include 
#include 
#include 

#ifdef __EMSCRIPTEN__
#include 
#endif

typedef struct person_info {
  char name[20];
  int age;
} person_info;

typedef struct car_info {
  unsigned char nbr_cars;
  char brand1[10];
} car_info;

void EMSCRIPTEN_KEEPALIVE print_person_info(void *person_info_ptr) {
  struct person_info *info = (struct person_info *) person_info_ptr;
  printf("In print_person_info\\n");
  printf("Person name: %s, person age: %d\\n",info->name,info->age);
  emscripten_cancel_main_loop();
}

void EMSCRIPTEN_KEEPALIVE print_car_info(void *car_info_ptr) {
  car_info *info = (car_info *) car_info_ptr;
  printf("In print_car_info\\n");
  printf("Number of cars: %d, first brand: %s\\n",info->nbr_cars,info->brand1);
  emscripten_cancel_main_loop();
}

void EMSCRIPTEN_KEEPALIVE get_func_pointer(char *name, void **func_ptr) {
  if (strcmp(name,"S3cr3tP@ssw0rd") == 0) {
    *func_ptr = print_car_info;
  } else {
    *func_ptr = print_person_info;
  }
}

void EMSCRIPTEN_KEEPALIVE func_ptr_overwrite2(char *name, char *age) {
  void *func_ptr;
  struct person_info info;
  char buf[50];
  get_func_pointer(name,&func_ptr);
  sprintf(&(info.name[0]),"%s",name);
  info.age = (char) atoi(age);
  sprintf(buf,"The entered name is: %s",name);
  emscripten_set_main_loop_arg(func_ptr, (void *)&info, 1, 0);
}
 
        `
    },
    {
        "name": "String format bug",
        "description": `You used to be able to get arbitrary code execution with format string bugs via the ‘%n’ modifier. Nowadays you typically only get information disclosure since many C compilers disallow the use of the %n modifier because of its security implications. The situation is the same with Wasm – it doesn’t appear to be possible to get arbitrary code execution, but information disclosure is indeed possible. By entering a suitable input, we can leak out the value of the variable ‘secret_password’:
        `,
        "link": "",
        "code": `
#include 
#include 

#ifdef __EMSCRIPTEN__
#include 
#endif

void EMSCRIPTEN_KEEPALIVE format_string_bug(char *str) {
  char secret_password[] = "MyP@ssw0rd!!";
  printf("you entered = ");
  printf(str);
  printf("\\n");
}
        `
    },
    {
        "name": "Buffer overread",
        "description": "Buffer overread vulnerability that allows a malicious user to leak memory from adjacent variables",
        "link": "",
        "code": `
#include 
#include 

#ifdef __EMSCRIPTEN__
#include 
#endif

void EMSCRIPTEN_KEEPALIVE buffer_overread(int start_pos, int end_pos) {
  char buf[200];
  char secret_password[256] = "S3cr3tP@ssw0rd";
  char msg[256] = "This is a very innocent message.";
    unsigned char e = end_pos;
    if (e > strlen(msg)) {
        printf("Do not try to read past the end.\\n");
    } else {
        snprintf(buf,(end_pos - start_pos) + 1,"%s",&msg[start_pos]);
        printf("Contents: %s\\n",buf);
    }
}
        `
    }
]

export default memory;