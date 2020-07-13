#include "utils.h"
#include "socket_client.h"
#include <string>
#include <chrono>
#include <thread>

void LOG(std::string some_string)
{
    std::string LOGS_DOCKER = parseEnvVariables((char *)"LOGS_DOCKER");
    log(LOGS_DOCKER + "/wait_for_server.log", some_string);
}

int main(int argc, char *argv[])
{
    std::string SWAM_CONTAINER = parseEnvVariables((char *)"SWAM_CONTAINER");
    std::string SWAM_SOCKET_PORT = parseEnvVariables((char *)"SWAM_SOCKET_PORT");
    LOG("SWAM_CONTAINER: " + SWAM_CONTAINER);
    LOG("SWAM_SOCKET_PORT: " + SWAM_SOCKET_PORT);

    LOG("Waiting for Swam server...");
    int sockfd;
    while (true) {
        try {
            sockfd = connectToServer(&SWAM_CONTAINER[0], std::stoi(SWAM_SOCKET_PORT));
            LOG("sockfd: " + std::to_string(sockfd));
            close(sockfd);
            break;
        } catch (...) {
            std::this_thread::sleep_for(std::chrono::milliseconds(2000));
        }
    }
    LOG("Swam is online!");
    exit(0);
}
