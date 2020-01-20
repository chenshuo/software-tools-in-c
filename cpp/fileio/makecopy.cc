// makecopy -- copy one file to another

#include "../lib.h"
#include <stdio.h>

int main(int argc, const char* argv[])
{
  if (argc != 3)
    error("Usage: makecopy old new");

  File fin(argv[1], "r");
  File fout(argv[2], "w");
  fcopy(fin.get(), fout.get());
}

