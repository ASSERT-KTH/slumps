#include "utils.h"
#include "socket_client.h"
#include <string>
#include <thread>

int main(int argc, char *argv[])
{
    std::string SWAM_SOCKET_HOST = parseEnvVariables((char *)"SWAM_SOCKET_HOST");
    std::string SWAM_SOCKET_PORT = parseEnvVariables((char *)"SWAM_SOCKET_PORT");

    // TODO: Check if uncaught exception leads to exit code != 0
    wait_for_server(&SWAM_SOCKET_HOST[0], std::stoi(SWAM_SOCKET_PORT));

    exit(0);
}
