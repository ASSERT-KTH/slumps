#include <iostream>
#include <cstdlib>
#include <string>
#include <fstream>
#include <vector>
#include <sys/shm.h>
#include <unistd.h>
#include <sys/wait.h>
#include <stdlib.h>

#define AFL_SHM_SIZE 65536
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

void log_file(char *filename)
{
    std::vector<std::string> vector = readFileToVector(filename);
    for (int i = 0; i < vector.size(); ++i)
    {
        LOG(vector[i]);
    }
}

void execute_swam(char *fuzzed_input)
{
    // TODO: Do something proper here...
}

void pass_data_to_afl(uint8_t *execution_data, uint8_t *trace_bits)
{

    // Dummy with random coverage:
    srand(time(NULL));
    for (int i = 0; i < 10; i++)
    {
        int random_branch = rand() % AFL_SHM_SIZE;
        trace_bits[random_branch] += 1;
    }

    // TODO: Read an actual file with branch coverage

    /*
    for (int i = 0; i < AFL_SHM_SIZE; i++)
    {
        if (execution_data[i] != 0)
        {
            LOG(i + " -> " + execution_data[i]);
            trace_bits[i] += execution_data[i];
        }
    }
    */
}

void test_nested_if(char *fuzzed_input, uint8_t *trace_bits)
{
    // Function to test how AFL reacts to code coverage. Runs
    // code execution and feeds data to AFL in one go.

    std::vector<std::string> vector = readFileToVector(fuzzed_input);

    if (vector[0].rfind("one", 0) == 0)
    {
        trace_bits[1] += 1;
        if (vector[0].rfind("oneone", 0) == 0)
        {
            trace_bits[2] += 1;
            if (vector[0].rfind("oneoneone", 0) == 0)
            {
                trace_bits[3] += 1;

                if (vector[0].rfind("oneoneonetwo", 0) == 0)
                {
                    trace_bits[4] += 1;
                    if (vector[0].rfind("oneoneonetwotwo", 0) == 0)
                    {
                        trace_bits[5] += 1;
                        exit(1);
                    }
                }
            }
        }
    }
}

void main_fuzz(char *fuzzed_input, uint8_t *trace_bits)
{
    log_file(fuzzed_input);

    // Real application
    execute_swam(fuzzed_input);
    uint8_t *execution_data = (uint8_t *)malloc(AFL_SHM_SIZE);
    // TODO: Read path coverage from file into execution_data
    pass_data_to_afl(execution_data, trace_bits);
    free(execution_data);

    // Test application
    // test_nested_if(fuzzed_input, trace_bits);
}

void fork_server(char *fuzzed_input, uint8_t *trace_bits)
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

    LOG("Starting the 'Fork server handshake'.");
    LOG("Phone home and tell AFL that we're OK.");
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
        LOG("##### NEW FORK RUN #####");

        // This will block until AFL sends us something. Abort if read fails.
        LOG("Wait for AFL by reading from the pipe.");
        if (read(198, &status, 4) != 4)
        {
            LOG("Read failed");
            close(198);
            close(199);
            exit(1);
        }
        LOG("Read status: " + std::to_string(status));

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
            LOG("This is the child process.");
            close(198);
            close(199);
            main_fuzz(fuzzed_input, trace_bits);
            exit(0);
        }

        LOG("Writing child pid to parent: " + std::to_string(pid));
        write(199, &pid, 4);

        /* 
    The fuzzer is no longer an immediate parent of the fuzzed process, 
    and as a grandparent, it can't directly use waitpid(); there is 
    also no other simple, portable API to get notified about the 
    process' exit status. We fix that simply by having the shim do 
    the waiting, then send the status code to the fuzzer.
    */

        LOG("Waiting for child...");
        if (waitpid(pid, &status, 0) <= 0) // Technically only fails at -1; 0 means still running
        {
            LOG("waitpid() failed.");
            close(198);
            close(199);
            exit(1);
        }

        if (!WIFEXITED(status))
        { // Not sure how this could happen
            LOG("WIFEXITED(status): " + std::to_string(WIFEXITED(status)));
            close(198);
            close(199);
            exit(1);
        }

        // Need to translate return value of waitpid to exit code
        int exit_status = WEXITSTATUS(status);
        LOG("Exit code status: " + std::to_string(exit_status));

        write(199, &exit_status, 4);
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
    LOG("########## NEW MAIN ##########");
    uint8_t *trace_bits = get_shm();

    // Mark a location to show we are instrumented
    trace_bits[0]++;

    log_args(argc, argv);

    // Since it is not entirely clear how AFL modifies the args in the middle of
    // the function call, we can do a test.
    // TODO: Copy args, modify slightly (avoid compiler optimization) and use for fork_server input

    fork_server(argv[1], trace_bits);

    return 0;
}
