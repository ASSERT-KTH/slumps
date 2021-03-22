#include <stdio.h>
#include <string.h>

void buffer_overread(int start_pos, int end_pos) {
    char buf[200];
    char secret_password[256] = "S3cr3tP@ssw0rd";
    char msg[256] = "This is a very innocent message.";
    unsigned char e = end_pos;

    snprintf(buf,(end_pos - start_pos) + 1,"%s",&msg[start_pos]);
    printf("Contents: %s\n",buf);
}

int main(){
    printf("Overread\n");
    buffer_overread(256, 270);

    return 0;
}