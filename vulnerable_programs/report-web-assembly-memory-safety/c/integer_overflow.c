#include <stdio.h>
#include <string.h>

#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#endif

/*
 integer overflow vulnerability that allows a malicious user to leak memory from adjacent variables (vulnerability bolded):
*/
void EMSCRIPTEN_KEEPALIVE buffer_overread(int start_pos, int end_pos) {
 char buf[200];
 char secret_password[256] = "S3cr3tP@ssw0rd";
 char msg[256] = "This is a very innocent message.";
    unsigned char e = end_pos;
    if (e > strlen(msg)) {
        printf("Do not try to read past the end.\n");
    } else {
        snprintf(buf,(end_pos - start_pos) + 1,"%s",&msg[start_pos]);
        printf("Contents: %s\n",buf);
    }
}