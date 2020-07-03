#include <stdlib.h>
#include <string.h>
#include <iostream>

void error(const char *);
int connectToServer();
int getRequiredBytes(std::string);
void clientWrite(int, char*);
void clientRead(int, char*);
int runClient(char*, char*);