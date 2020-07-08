#include "socket_client.h"
#define AFL_SHM_SIZE 65536

int main(int argc, char *argv[])
{
    std::string inputFile = (std::string) argv[1];

    char readBuffer[AFL_SHM_SIZE + 1]; // + 1 for exit code

    int fileSize = (int)getFileSize(inputFile);
    char sendBuffer[fileSize];
    readBinaryToBuffer(sendBuffer, fileSize, inputFile);
    std::reverse(sendBuffer, &sendBuffer[sizeof(sendBuffer)]); // Reverse order of sendBuffer

    runClient(sizeof(sendBuffer), sendBuffer, sizeof(readBuffer), readBuffer);
    exit(0);
};