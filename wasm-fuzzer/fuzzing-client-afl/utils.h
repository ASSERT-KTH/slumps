#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <string.h>
#include <fstream>
#include <sys/stat.h>
#include <sstream>
#include <vector>
#include <cerrno>
#include <cstring>

enum LogEnum
{
    ERROR,
    WARNING,
    INFO,
    DEBUG
};

void log_default(std::string, LogEnum);
void log(std::string, std::string);
void printBuffer(int, char *);
void logBuffer(std::string, int, char *);
long getFileSize(std::string);

void readBinaryToBuffer(char *, int, std::string);

std::string parseEnvVariables(char *);
std::vector<std::string> split(const std::string &, char);

void clearFile(std::string);

template <typename T>
void writeNumberToFile(T, std::string);

#endif