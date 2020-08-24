#include "socket_client.h"

// Most code based on: https://www.bogotobogo.com/cplusplus/sockets_server_client.php

void errorAndThrow(const char *msg)
{
    std::string msgStr = msg;
    log_default(msgStr, ERROR);
    throw std::runtime_error(msg);
}

int connectToServer(char *socket_hostname, int socket_port)
{
    int sockfd;
    struct hostent *server;
    struct sockaddr_in serv_addr;

    /* 
        SOCK_STREAM: TCP (reliable, connection oriented)
        SOCK_DGRAM: UDP (unreliable, connectionless)
        AF_INET: IPv4 protocol
        AF_INET6: IPv6 protocol 
    */
    sockfd = socket(AF_INET, SOCK_STREAM, 0);

    if (sockfd < 0)
        errorAndThrow("Error opening socket");

    server = gethostbyname(socket_hostname);

    if (server == NULL)
    {
        errorAndThrow("Error, no such host");
        // log_default("Error, no such host", ERROR);
        // exit(1);
    }

    bzero((char *)&serv_addr, sizeof(serv_addr)); // Maybe use memset

    serv_addr.sin_family = AF_INET;

    bcopy((char *)server->h_addr,
          (char *)&serv_addr.sin_addr.s_addr,
          server->h_length);

    serv_addr.sin_port = htons(socket_port);

    if (connect(sockfd, (struct sockaddr *)&serv_addr, sizeof(serv_addr)) < 0)
        errorAndThrow("Error connecting");

    return sockfd;
}

void clientWrite(int sockfd, char *sendBuffer, int sizeBuffer)
{
    int n = write(sockfd, sendBuffer, sizeBuffer);
    if (n < 0)
        errorAndThrow("Error writing to socket");
}

void clientRead(int sockfd, char *readBuffer, int sizeBuffer)
{
    int n = 0;
    while (n < sizeBuffer)
    {
        // Occasionally, read() finishes reading before all the data has
        // been written to the socket by the SWAM server. Therefore, this
        // is in a loop.
        int nNew = read(sockfd, readBuffer + n, sizeBuffer - n);
        if (nNew < 0)
            errorAndThrow("Error reading from socket");
        n = n + nNew;
    }
}

void wait_for_server(char *socket_hostname, int socket_port, int wait_milli, int timeout_milli)
{
    log_default("Waiting for Swam server...", INFO);

    auto t_start = std::chrono::high_resolution_clock::now();
    int duration_milli;

    int sockfd;
    while (true)
    {
        try
        {
            sockfd = connectToServer(socket_hostname, socket_port);
            close(sockfd);
            break;
        }
        catch (const std::runtime_error& error)
        {
            auto t_end = std::chrono::high_resolution_clock::now();
            duration_milli = std::chrono::duration<double, std::milli>(t_end-t_start).count();
            if (duration_milli > timeout_milli) {
                log_default("Timeout reached in wait_for_server", ERROR);
                throw error; 
            }
            log_default("Trying to connect again in 4 seconds...", INFO);
            usleep(wait_milli);
            std::this_thread::sleep_for(std::chrono::milliseconds(wait_milli));
        }
    }
    log_default("Can connect to Swam!", INFO);
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
