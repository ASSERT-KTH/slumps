#include <iostream>
#include <cstdlib>
#include <string>
#include <fstream>
#include <vector>
#include <sys/shm.h>
#include <unistd.h>

#define SHM_ENV_VAR "__AFL_SHM_ID"
#define LOGFILE "interface.log"

int LOG(std::string some_string)
{
    std::ofstream logfile;
    logfile.open(LOGFILE, std::ios_base::app);
    logfile << some_string + "\n";
    logfile.close();
    return 0;
}

std::vector<std::string> readFileToVector(const std::string &filename)
{
    std::ifstream source;
    source.open(filename);
    std::vector<std::string> lines;
    std::string line;
    while (std::getline(source, line))
    {
        lines.push_back(line);
    }
    return lines;
}

uint8_t *get_shm()
{
    // putenv((char *)"SHM_ENV_VAR=5");

    char *shm_name = std::getenv(SHM_ENV_VAR);
    if (!shm_name)
    {
        LOG("SHM_ENV_VAR not found!");
        exit(1);
    }

    LOG("shm_name: " + std::string(shm_name));
    key_t key = atoi(shm_name);
    uint8_t *trace_bits = (uint8_t *)shmat(key, 0, 0);
    if (trace_bits == (uint8_t *)-1)
    {
        LOG("Failed to access shared memory");
        exit(1);
    }
    LOG("Shared memory attached. Value at loc 3 = " + trace_bits[3]);
    return trace_bits;
}

void fork_server()
{
    // The Fork server:
    // https://lcamtuf.blogspot.com/2014/10/fuzzing-binaries-without-execve.html
    
    int status = 0;

    LOG("Phone home and tell the parent that we're OK.");
    if (write(199, &status, 4) != 4)
    {
        LOG("Write failed");
        exit(1);
    }

    // This will block until the parent sends us something. Abort if read fails.
    LOG("Wait for parent by reading from the pipe.");
    if (read(198, &status, 4) != 4)
    {
        LOG("Read failed");
        exit(1);
    }
    LOG("Status: " + std::to_string(status));

    // Programm runs concurrently in two forks from here
    // Returns 0 if in the child process and returns the
    // child's pid if in the parent process.
    int pid = fork();
    if (pid < 0)
    {
        LOG("Fork failed\n");
        exit(1);
    }
    else if (pid == 0)
    {
        LOG("This is the child process.");
        // TODO: Do something proper here...
        return;
    }

    LOG("Writing child pid to parent: " + std::to_string(pid));
    write(199, &pid, 4);

    LOG("Waiting for child...");
    if (waitpid(pid, &status, 0) <= 0)
    {
        LOG("Child fork crashed");
        exit(1);
    }

    LOG("Status: " + std::to_string(status));
    write(199, &status, 4);

    close(198);
    close(199);
}

int main(int argc, char *argv[])
{
    uint8_t *trace_bits = get_shm();

    // Mark a location to show we are instrumented
    trace_bits[0]++;

    std::vector<std::string> vector = readFileToVector(argv[1]);
    for (int i = 0; i < vector.size(); ++i)
    {
        LOG(vector[i]);
    }

    for (int i = 0; i < argc; ++i)
    {
        LOG("argv[" + std::to_string(i) + "]: " + std::string(argv[i]));
    }

    return 0;
}
