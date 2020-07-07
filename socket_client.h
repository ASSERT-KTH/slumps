#ifndef SOCKET_CLIENT_H
#define SOCKET_CLIENT_H

#include "utils.h"

#include <stdlib.h>
#include <string.h>
#include <iostream>
#include <stdio.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netdb.h>
#include <fstream>

void error(const char *);
int connectToServer();
void clientWrite(int, char*, int);
void clientRead(int, char*, int);
int runClient(int, char*, int, char*);

#endif