#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>

struct stat st = {0};

int main(void)
{
    if (stat("directory", &st) == -1) {
        mkdir("directory", 0700);
    }

    return 0;
}