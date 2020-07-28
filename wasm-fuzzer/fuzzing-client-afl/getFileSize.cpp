#include "utils.h"

#include <iostream>

int main(int argc, char *argv[])
{
    std::string filePath = (std::string) argv[1];
    printf("%li\n", getFileSize(filePath));

    exit(0);
};