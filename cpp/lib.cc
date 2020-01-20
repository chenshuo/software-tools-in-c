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

void fcopy(FILE* fin, FILE* fout)
{
  char buf[BUFSIZ];
  size_t nr = 0;
  while ( (nr = fread(buf, 1, sizeof buf, fin)) > 0) {
    size_t nw = fwrite(buf, 1, nr, fout);
    if (nr != nw)
      error("Failed to copy files.");
  }
}
