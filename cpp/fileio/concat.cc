// concat -- concatenate files onto standard output

#include "../lib.h"
#include <stdio.h>

int main(int argc, const char* argv[])
{
  for (int i = 1; i < argc; ++i) {
    File f(argv[i], "r");
    fcopy(f.get(), stdout);
  }
}
