#include "socket_client.h"


// Most code based on: https://www.bogotobogo.com/cplusplus/sockets_server_client.php

void error(const char *msg)
{
    perror(msg);
    exit(0);
}

int connectToServer(char *socket_hostname, int socket_port)
{
    int sockfd;
    struct hostent *server;
    struct sockaddr_in serv_addr;

    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if (sockfd < 0)
        error("ERROR opening socket");

    server = gethostbyname(socket_hostname);

    if (server == NULL)
    {
        fprintf(stderr, "ERROR, no such host\n");
        exit(0);
    }

    bzero((char *)&serv_addr, sizeof(serv_addr)); // Maybe use memset

    serv_addr.sin_family = AF_INET;

    bcopy((char *)server->h_addr,
          (char *)&serv_addr.sin_addr.s_addr,
          server->h_length);

    serv_addr.sin_port = htons(socket_port);

    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        error("ERROR connecting");

    return sockfd;
}

void clientWrite(int sockfd, char *sendBuffer, int sizeBuffer)
{
    int n = write(sockfd, sendBuffer, sizeBuffer);
    if (n < 0)
        error("ERROR writing to socket");
    printf("Wrote to server!\n");
}

void clientRead(int sockfd, char *readBuffer, int sizeBuffer)
{
    int n = read(sockfd, readBuffer, sizeBuffer);
    if (n < 0)
        error("ERROR reading from socket");
    printf("Received message!\n");
}

void runClient(
    int sizeSendBuffer,
    char *sendBuffer,
    int sizeReadBuffer,
    char *readBuffer,
    char *socket_hostname,
    int socket_port)
{
    int sockfd = connectToServer(socket_hostname, socket_port);
    clientWrite(sockfd, sendBuffer, sizeSendBuffer);
    clientRead(sockfd, readBuffer, sizeReadBuffer);
    close(sockfd);
};
