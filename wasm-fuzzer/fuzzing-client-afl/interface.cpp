#include "interface.h"

#define AFL_SHM_SIZE 65536

void LOG(std::string some_string)
{
    std::string DOCKER_LOGS = parseEnvVariables((char *)"DOCKER_LOGS");
    log(DOCKER_LOGS + "/interface.log", some_string);
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

void log_file(char *filename)
{
    std::vector<std::string> vector = readFileToVector(filename);
    for (int i = 0; i < vector.size(); ++i)
    {
        LOG(vector[i]);
    }
}

uint8_t *getShm()
{
    std::string shmStr = parseEnvVariables((char *)"__AFL_SHM_ID");
    LOG("shmStr: " + shmStr);

    key_t key = std::stoi(shmStr);

    uint8_t *trace_bits = (uint8_t *)shmat(key, 0, 0);
    if (trace_bits == (uint8_t *)-1)
    {
        LOG("Failed to access shared memory");
        exit(1);
    }
    LOG("Shared memory attached.");
    return trace_bits;
}

void fillTraceDummyData(uint8_t *trace_bits)
{
    srand(time(NULL));
    for (int i = 0; i < 10; i++)
    {
        int random_branch = rand() % AFL_SHM_SIZE;
        trace_bits[random_branch] += 1;
    }
}

void pass_data_to_afl(int sizeReadBuffer, char *readBuffer, uint8_t *trace_bits)
{
    // Read path coverage from readBuffer into trace_bits
    for (int i = 1; i < sizeReadBuffer; i++)
    {
        trace_bits[i - 1] += readBuffer[i];
    }
}

void main_fuzz(
    char *fuzzed_input_path,
    uint8_t *trace_bits,
    int requiredBytes)
{

    std::string DUMMY_TESTING_AFL = parseEnvVariables((char *)"DUMMY_TESTING_AFL");
    if (DUMMY_TESTING_AFL == "True")
    {
        fillTraceDummyData(trace_bits);
        exit(0);
    }

    // TODO: Replace sendBuffer by 
    char sendBuffer[requiredBytes];
    readBinaryToBuffer(sendBuffer, sizeof(sendBuffer), (std::string)fuzzed_input_path);

    char readBuffer[AFL_SHM_SIZE + 1]; // + 1 for exit code

    std::string SWAM_SOCKET_HOST = parseEnvVariables((char *)"SWAM_SOCKET_HOST");
    std::string SWAM_SOCKET_PORT = parseEnvVariables((char *)"SWAM_SOCKET_PORT");

    runClient(sizeof(sendBuffer), sendBuffer, sizeof(readBuffer), readBuffer, &SWAM_SOCKET_HOST[0], std::stoi(SWAM_SOCKET_PORT));

    pass_data_to_afl(sizeof(readBuffer), readBuffer, trace_bits);

    // Read exit code from readBuffer and exit with same code
    exit(readBuffer[0]);
}

void fork_server(char *fuzzed_input_path, uint8_t *trace_bits, int requiredBytes)
{
    // The Fork server (Prototype of this code in Assembly):
    // https://lcamtuf.blogspot.com/2014/10/fuzzing-binaries-without-execve.html

    /*
    ASSUMPTION:
    Numbered file descriptos are relative and accessible to a process and
    all it's child processes. In this case, 198 and 199 seem to be
    hard-coded by AFL and thereby accessible here.
    */

    int status = 0;

    // Starting the 'Fork server handshake'

    // Phone home and tell AFL that we're OK
    if (write(199, &status, 4) != 4)
    {
        LOG("Write failed");
        close(199);
        exit(1);
    }

    // The parent process that continuously runs through this while-loop
    // and is creating forks of itself is called the "fork server".
    while (true)
    {
        // Wait for AFL by reading from the pipe.
        // This will block until AFL sends us something. Abort if read fails.
        if (read(198, &status, 4) != 4)
        {
            LOG("Read failed");
            close(198);
            close(199);
            exit(1);
        }

        /*
    Programm runs concurrently in two forks from here
    Returns 0 if in the child process and returns the
    child's pid if in the parent process.
    */
        int pid = fork();
        if (pid < 0)
        {
            LOG("Fork failed");
            close(198);
            close(199);
            exit(1);
        }
        else if (pid == 0)
        {
            // This is the child process
            close(198);
            close(199);
            main_fuzz(fuzzed_input_path, trace_bits, requiredBytes);
            exit(0);
        }

        // Writing child pid to parent
        write(199, &pid, 4);

        /* 
    The fuzzer is no longer an immediate parent of the fuzzed process, 
    and as a grandparent, it can't directly use waitpid(); there is 
    also no other simple, portable API to get notified about the 
    process' exit status. We fix that simply by having the shim do 
    the waiting, then send the status code to the fuzzer.
    */

        // Waiting for child
        if (waitpid(pid, &status, 0) <= 0) // Technically only fails at -1; 0 means still running
        {
            LOG("waitpid() failed.");
            close(198);
            close(199);
            exit(1);
        }

        if (WIFEXITED(status))
        {
            // Need to translate return value of waitpid to exit code (e.g. 256 translates to 1)
            int exit_status = WEXITSTATUS(status);
            write(199, &exit_status, 4);
        }
        else if (WIFSIGNALED(status)) // Process was stopped/terminated by signal;
        {
            // TODO: Find out why this branch gets triggered
            LOG("Signal status: " + std::to_string(status));
            LOG("WTERMSIG(status): " + std::to_string(WTERMSIG(status)));
            LOG("WSTOPSIG(status): " + std::to_string(WSTOPSIG(status)));
            write(199, &status, 4);
        }
        else
        {
            LOG("Weird status: " + std::to_string(status));
            close(198);
            close(199);
            exit(1);
        }
    }
}

void log_args(int argc, char *argv[])
{
    for (int i = 0; i < argc; ++i)
    {
        LOG("argv[" + std::to_string(i) + "]: " + std::string(argv[i]));
    }
}

int main(int argc, char *argv[])
{
    // TODO: Remove everything related to requiredBytes; not necessary anymore
    log_args(argc, argv);

    char *fuzzed_input_path = argv[1];
    int requiredBytes = atoi(argv[2]);

    uint8_t *trace_bits = getShm();
    trace_bits[0]++; // Mark a location to show we are instrumented

    fork_server(fuzzed_input_path, trace_bits, requiredBytes);

    return 0;
}
