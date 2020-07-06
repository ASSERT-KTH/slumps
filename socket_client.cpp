#include "socket_client.h"

#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <fstream>

#define SOCKET_PORT 9999
#define SOCKET_HOST "localhost"

// Most code based on: https://www.bogotobogo.com/cplusplus/sockets_server_client.php

void error(const char *msg)
{
    perror(msg);
    exit(0);
}

int connectToServer()
{
    int sockfd;
    struct hostent *server;
    struct sockaddr_in serv_addr;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if (sockfd < 0)
        error("ERROR opening socket");

    server = gethostbyname(SOCKET_HOST);

    if (server == NULL)
    {
        fprintf(stderr, "ERROR, no such host\n");
        exit(0);
    }

    bzero((char *)&serv_addr, sizeof(serv_addr));

    serv_addr.sin_family = AF_INET;

    bcopy((char *)server->h_addr,
          (char *)&serv_addr.sin_addr.s_addr,
          server->h_length);

    serv_addr.sin_port = htons(SOCKET_PORT);

    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        error("ERROR connecting");

    return sockfd;
}

// The input file is supposed to have the correct number of
// bytes. Only call this in the beginning.
int getRequiredBytes(std::string pathToInput)
{
    int requiredBytes = 0;

    // TODO: Read input file

    return requiredBytes + 1; // For new line
};

// This function aims to write a basic integer to a buffer.
void fillDummyBuffer(char *buffer)
{
    int64_t fiboNumber = 20;
    int8_t newLine = 10; // New line

    for (int i = 0; i < (sizeof(buffer) - 1); i++)
    {
        buffer[(sizeof(buffer) - 2) - i] = fiboNumber & 0xFF;
        fiboNumber = fiboNumber >> 8;
    }
    buffer[(sizeof(buffer) - 1)] = newLine;

    for (int i = 0; i < (sizeof(buffer) - 1); i++)
    {
        printf("buffer %i: %i \n", i, buffer[i]);
    }
};

void readFileToBuffer(char *buffer, std::string pathToInput)
{
    std::ifstream rf(pathToInput, std::ios::out | std::ios::binary);
    if (!rf)
    {
        printf("Cannot open prepared_input.dat to read it!\n");
        exit(1);
    }
    rf.read(buffer, sizeof(buffer));
    rf.close();
    if (rf.bad())
    {
        // Because has not reached end of file.
        printf("Error occurred at reading time!\n");
        exit(1);
    }
    int8_t newLine = 10; // New line
    buffer[(sizeof(buffer) - 1)] = newLine;

    for (int i = 0; i < (sizeof(buffer) - 1); i++)
    {
        printf("buffer %i: %i \n", i, buffer[i]);
    }
}

void clientWrite(int sockfd, char *sendBuffer)
{
    int n = write(sockfd, sendBuffer, sizeof(sendBuffer));
    std::cout << "Wrote to server!" << std::endl;
    if (n < 0)
        error("ERROR writing to socket");
    bzero(sendBuffer, sizeof(sendBuffer));
}

void clientRead(int sockfd, char *readBuffer)
{
    int n = read(sockfd, readBuffer, sizeof(readBuffer));
    if (n < 0)
        error("ERROR reading from socket");
    printf("%s\n", readBuffer);
    bzero(readBuffer, sizeof(readBuffer));
}

int runClient(char *sendBuffer, char *readBuffer)
{
    int sockfd = connectToServer();
    clientWrite(sockfd, sendBuffer);
    clientRead(sockfd, readBuffer);
    close(sockfd);
    return 0;
};

int main(int argc, char *argv[])
{
    // TODO: Parse input file from args (./prepared_input.dat)

    int requiredBytes = getRequiredBytes("./prepared_input.dat");
    char sendBuffer[requiredBytes];
    char readBuffer[4096];

    readFileToBuffer(sendBuffer, "./prepared_input.dat");
    // fillDummyBuffer(sendBuffer);

    runClient(sendBuffer, readBuffer);
    exit(0);
};
