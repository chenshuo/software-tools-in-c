#include "lib.h"

#include <stdio.h>
#include <stdlib.h>

void error(const char* message)
{
  fprintf(stderr, "%s\n", message);
  exit(EXIT_FAILURE);
}

void error_open(const char* filename)
{
  fprintf(stderr, "%s", filename);
  error(": can't open file");
}

