// echo -- echo command line arguments to output
#include <stdio.h>

int main(int argc, char* argv[])
{
  for (int i = 1; i < argc; ++i)
  {
    if (i > 1)
      putchar(' ');
    fputs(argv[i], stdout);  // or printf("%s", argv[i]);
  }
  if (argc > 1)
  {
    puts("");  // or printf("\n");
  }
}
