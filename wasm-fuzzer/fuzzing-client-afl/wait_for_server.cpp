#include "utils.h"
#include "socket_client.h"
#include <string>
#include <chrono>
#include <thread>


int main(int argc, char *argv[])
{
    setbuf(stdout, NULL);  // For some reason stdout gets buffered until exit otherwise
    std::string SWAM_SOCKET_HOST = parseEnvVariables((char *)"SWAM_SOCKET_HOST");
    std::string SWAM_SOCKET_PORT = parseEnvVariables((char *)"SWAM_SOCKET_PORT");

    printf("Waiting for Swam server...\n");
    int sockfd;
    while (true) {
        try {
            sockfd = connectToServer(&SWAM_SOCKET_HOST[0], std::stoi(SWAM_SOCKET_PORT));
            close(sockfd);
            break;
        } catch (...) {
            printf("Trying to connect again in 4 seconds...\n");
            std::this_thread::sleep_for(std::chrono::milliseconds(4000));
        }
    }
    printf("Can connect to Swam!\n");
    exit(0);
}
