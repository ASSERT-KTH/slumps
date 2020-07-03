#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <unistd.h>
#include <string.h>
#include <vector.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>

#define SOCKET_PORT 9999
#define SOCKET_HOST "localhost"

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

// This was C#!!!! WTF!
enum WasmType
{
    Int32 = 'Int32',
    Int64 = 'Int64',
    Float32 = 'Float32',
    Float64 = 'Float64'
};

class WasmValue
{

    // char [64] buffer;
};

int main(int argc, char *argv[])
{
    // TODO: Parse arguments

    int requiredBytes = getRequiredBytes();
    runClient(requiredBytes);
    exit(0);
};

int getRequiredBytes(std::vector<std::string> types)
{
    int requiredBytes = 0;
    for ( auto i = types.begin(); i != types.end(); i++ ) {
    {
        switch (types[i])
        {
        case "Int32":
            requiredBytes += 4;
            break;
        case "Int64":
            requiredBytes += 8;
            break;
        case "Float32":
            requiredBytes += 4;
            break;
        case "Float64":
            requiredBytes += 8;
            break;
        default:
            error("Type does not exist!");
        }
    }
    return requiredBytes + 1; // For new line
}

int runClient(int requiredBytes)
{
    int n;
    char sendBuffer[requiredBytes];
    char readBuffer[4096];
    int sockfd = connectToServer();

    // printf("Please enter the message: ");
    // bzero(buffer, 256);
    // fgets(buffer, 255, stdin);

    int64_t fiboNumber = 20;
    int8_t newLine = 10;

    for (int i = 0; i < (requiredBytes - 1); i++)
    {
        sendBuffer[(requiredBytes - 2) - i] = fiboNumber & 0xFF;
        fiboNumber = fiboNumber >> 8;
    }
    sendBuffer[(requiredBytes - 1)] = newLine;

    for (int i = 0; i < (requiredBytes - 1); i++)
    {
        printf("buffer %i: %i \n", i, sendBuffer[i]);
    }

    n = write(sockfd, sendBuffer, requiredBytes);
    std::cout << "Wrote to server!" << std::endl;

    if (n < 0)
        error("ERROR writing to socket");

    bzero(sendBuffer, requiredBytes);
    n = read(sockfd, readBuffer, (4096));

    if (n < 0)
        error("ERROR reading from socket");

    printf("%s\n", readBuffer);

    close(sockfd);
    return 0;
};
