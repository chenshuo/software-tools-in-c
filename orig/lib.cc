#include "p2c.h"
#include <stdio.h>

character getc(character& ch)
{
  ch = getchar();
  return ch;
}

void putc(character ch)
{
  putchar(ch);
}

boolean isupper(character c)
{
  return 'A' <= c && c <= 'Z';
}

#ifdef MAIN
void MAIN();

int main()
{
  MAIN();
}
#endif
