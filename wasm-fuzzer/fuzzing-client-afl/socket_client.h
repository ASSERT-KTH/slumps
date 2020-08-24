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
#include <algorithm>
#include <ctime>
#include <cstdio>

void error(const char *);
int connectToServer(char *, int);
void clientWrite(int, char *, int);
void clientRead(int, char *, int);
void wait_for_server(char *, int, int = 4000, double = 40000);
void runClient(int, char *, int, char *, char *, int);

#endif
