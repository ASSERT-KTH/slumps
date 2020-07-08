#ifndef UTILS_H
#define UTILS_H

#include <stdio.h>
#include <string.h>
#include <fstream>
#include <sys/stat.h>
#include <sstream>
#include <vector>

void log(std::string, std::string);
void printBuffer(int, char *);
long getFileSize(std::string);

void readBinaryToBuffer(char *, int, std::string);

std::string parseEnvVariables(char *);
std::vector<std::string> split(const std::string &, char);

template <typename T>
void writeNumberToFile(T, std::string);

#endif