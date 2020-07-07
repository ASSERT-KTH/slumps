#include "prepare_wasm_input.h"

/*
Since WebAssembly only takes Int, Long, Float & Double as input parameters,
we want our first input parameters to be of this format as well. This helper
will parse numbers written as strings with according types written as strings
and write the resulting number to a file, which then can be accessed and 
manipulated by AFL.
*/

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

void translateArg(std::string arg, std::string argType, std::string pathName)
{
    std::string::size_type sz; // alias of size_t
    double doubleNumber = std::stod(arg, &sz);

    switch (resolveOption(argType))
    {
    case Int32:
    {
        int intNumber = std::round(doubleNumber);
        printf("Resulting int: %i\n", intNumber);
        writeNumberToFile(intNumber, pathName);
        break;
    }
    case Int64:
    {
        long longNumber = lround(doubleNumber);
        printf("Resulting long: %li\n", longNumber);
        writeNumberToFile(longNumber, pathName);
        break;
    }
    case Float32:
    {
        float floatNumber = (float)doubleNumber;
        printf("Resulting float: %f\n", floatNumber);
        writeNumberToFile(floatNumber, pathName);
        break;
    }
    case Float64:
    {
        writeNumberToFile(doubleNumber, pathName);
        printf("Resulting double: %f\n", doubleNumber);
        break;
    }
    default:
    {
        printf("No support for type %s\n", argType.c_str());
        exit(1);
    }
    }
}

void printResult(std::string filepath)
{
    printf("Finished prepare_wasm_input.main(). Checking result..\n");
    int fileSize = (int)getFileSize(filepath);
    printf("Total bytes written: %i\n", fileSize);
    char buffer[fileSize];
    readBinaryToBuffer(buffer, fileSize, filepath);
    std::reverse(buffer, &buffer[sizeof(buffer)]);
    printBuffer(sizeof(buffer), buffer);
    printf("-----------------\n");
}

int main(int argc, char *argv[])
{
    // TODO: Parse input file from args (./prepared_input.dat)

    std::string WASM_ARG_TYPES_LIST = parseEnvVariables((char *)"WASM_ARG_TYPES_LIST");
    std::string WASM_ARG_LIST = parseEnvVariables((char *)"WASM_ARG_LIST");

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
        translateArg(argArray[i], typeArray[i], "./prepared_input.dat");
    }

    printResult("./prepared_input.dat");

    exit(0);
};
