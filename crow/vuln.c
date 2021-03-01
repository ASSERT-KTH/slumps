#include <string.h>

void not_called() {
    //printf("Enjoy your shell!\n");
    system("/bin/bash");
}

void vulnerable_function(char* string, int size) {
    char buffer[size];
    strcpy(buffer, string);
}

int main(int argc, char** argv) {
    vulnerable_function(argv[1], 200);
    return 0;
}