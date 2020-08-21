#include "./utils.h"

#include <stdio.h>
#include <string.h>
#include <fstream>
#include <sys/stat.h>
#include <sstream>
#include <vector>
#include <algorithm> 

void log(std::string filename, std::string some_string)
{
    std::ofstream logfile;
    logfile.open(filename, std::ios_base::app);
    logfile << some_string + "\n";
    logfile.close();
}

void printBuffer(int sizeBuffer, char *buffer)
{
    for (int i = 0; i < sizeBuffer; i++)
    {
        printf("buffer %i: %i \n", i, buffer[i]);
    }
}

void logBuffer(std::string filename, int sizeBuffer, char *buffer)
{
    for (int i = 0; i < sizeBuffer; i++)
    {
        log(filename, "buffer " + std::to_string(i) + ": " + buffer[i]);
    }
}

long getFileSize(std::string filename)
{
    struct stat stat_buf;
    int rc = stat(filename.c_str(), &stat_buf);
    return rc == 0 ? stat_buf.st_size : -1;
}

void readBinaryToBuffer(char *buffer, int fileSize, std::string pathToInput)
{
    std::ifstream rf(pathToInput, std::ios::binary);
    if (!rf)
    {
        printf("Cannot open %s to read it!\n", pathToInput.c_str());
        exit(1);
    }

    rf.read(buffer, fileSize);
    rf.close();
    if (rf.bad())
    {
        // Because has not reached end of file.
        printf("Error occurred at reading time!\n");
        exit(1);
    }
}

std::string parseEnvVariables(char *envName)
{
    char *envChar = std::getenv(envName);
    if (!envChar)
    {
        printf("%s not defined.\n", envName);
        exit(1);
    }
    return std::string(envChar);
}

std::vector<std::string> split(const std::string &s, char delimiter)
{
    std::vector<std::string> tokens;
    std::string token;
    std::istringstream tokenStream(s);
    while (std::getline(tokenStream, token, delimiter))
    {
        tokens.push_back(token);
    }
    return tokens;
}

void clearFile(std::string pathName){
    std::ofstream wf(pathName, std::ios::out | std::ios::binary);
    if (!wf)
    {
        printf("Cannot open %s to write in it!\n", pathName.c_str());
        exit(1);
    }
    wf.write("", 0);
    wf.close();
    if (!wf.good())
    {
        printf("Error occurred at writing time!\n");
        exit(1);
    }
}

template void writeNumberToFile<double>(double, std::string);
template void writeNumberToFile<float>(float, std::string);
template void writeNumberToFile<long>(long, std::string);
template void writeNumberToFile<int>(int, std::string);

template <typename T>
void writeNumberToFile(T numberToWrite, std::string pathName)
{
    std::ofstream wf(pathName, std::ios::out | std::ios::binary | std::ios::app);
    if (!wf)
    {
        printf("Cannot open %s to write in it!\n", pathName.c_str());
        exit(1);
    }

    // Scala seems to read the other way around..
    char *buffer = (char *)&numberToWrite;
    std::reverse(buffer, &buffer[sizeof(numberToWrite)]);
    wf.write(buffer, sizeof(numberToWrite));
    // wf.write((char *)&numberToWrite, sizeof(numberToWrite));

    wf.close();
    if (!wf.good())
    {
        printf("Error occurred at writing time!\n");
        exit(1);
    }
}
