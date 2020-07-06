#include <stdio.h>
#include <stdlib.h>
#include <iostream>
#include <vector>
#include <sstream>
#include <iterator>
#include <iostream>
#include <fstream>
#include <cmath>

/*
Since WebAssembly only takes Int, Long, Float & Double as input parameters,
we want our first input parameters to be of this format as well. This helper
will parse numbers written as strings with according types written as strings
and write the resulting number to a file, which then can be accessed and 
manipulated by AFL.
*/

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

enum TypeOptions
{
    Option_Invalid,
    Int32,
    Int64,
    Float32,
    Float64
};

TypeOptions resolveOption(std::string input)
{
    if (input == "Int32")
        return Int32;
    if (input == "Int64")
        return Int64;
    if (input == "Float32")
        return Float32;
    if (input == "Float64")
        return Float64;
    return Option_Invalid;
}

template <typename T>
void writeToFile(T numberToWrite)
{
    std::ofstream wf("prepared_input.dat", std::ios::out | std::ios::binary);
    if (!wf)
    {
        printf("Cannot open prepared_input.dat!\n");
        exit(1);
    }
    wf.write((char *)&numberToWrite, sizeof(numberToWrite));
    wf.close();
    if (!wf.good())
    {
        printf("Error occurred at writing time!\n");
        exit(1);
    }
}

int translateArg(std::string arg, std::string argType)
{
    int bytesRequired = 0;
    std::string::size_type sz; // alias of size_t
    double doubleNumber = std::stod(arg, &sz);

    switch (resolveOption(argType))
    {
    case Int32:
    {
        int intNumber = std::round(doubleNumber);
        writeToFile(intNumber);
        bytesRequired += 4;
        break;
    }
    case Int64:
    {
        long longNumber = lround(doubleNumber);
        writeToFile(longNumber);
        bytesRequired += 8;
        break;
    }
    case Float32:
    {
        float floatNumber = (float)doubleNumber;
        writeToFile(floatNumber);
        bytesRequired += 4;
        break;
    }
    case Float64:
    {
        writeToFile(doubleNumber);
        bytesRequired += 8;
        break;
    }
    default:
    {
        printf("No support for type %s\n", argType.c_str());
        exit(1);
    }
    }
    return bytesRequired;
}

void printOutcome(int totalBytes)
{
    std::ifstream rf("prepared_input.dat", std::ios::out | std::ios::binary);
    if (!rf)
    {
        printf("Cannot open prepared_input.dat to read it!\n");
        exit(1);
    }
    char allNumbers[totalBytes];
    rf.read(allNumbers, totalBytes);
    rf.close();
    if (rf.bad())
    {
        // Because has not reached end of file.
        printf("Error occurred at reading time!\n");
        exit(1);
    }
    for (int i = 0; i < sizeof(allNumbers); ++i)
    {
        std::cout << allNumbers[i];
    }
    std::cout << std::endl;
}

int main(int argc, char *argv[])
{
    // TODO: Parse input file from args (./prepared_input.dat)

    char *WASM_ARG_TYPES_LIST_char = std::getenv("WASM_ARG_TYPES_LIST");
    char *WASM_ARG_LIST_char = std::getenv("WASM_ARG_LIST");

    if (!WASM_ARG_LIST_char || !WASM_ARG_TYPES_LIST_char)
    {
        printf("WASM_ARG_TYPES_LIST or WASM_ARG_LIST not defined.\n");
        exit(1);
    }

    std::string WASM_ARG_TYPES_LIST = std::string(WASM_ARG_TYPES_LIST_char);
    std::string WASM_ARG_LIST = std::string(WASM_ARG_LIST_char);
    std::vector<std::string> typeArray = split(WASM_ARG_TYPES_LIST, ',');
    std::vector<std::string> argArray = split(WASM_ARG_LIST, ',');

    if (typeArray.size() != argArray.size())
    {
        printf("Not the same amount of types and args. typeArray.size() = %lu; argArray.size() = %lu \n", typeArray.size(), argArray.size());
        exit(1);
    }

    int totalBytes = 0;
    for (int i = 0; i < typeArray.size(); ++i)
    {
        totalBytes += translateArg(argArray[i], typeArray[i]);
    }
    printf("Total bytes written: %i\n", totalBytes);
    printOutcome(totalBytes);

    exit(0);
};
