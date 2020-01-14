#include "p2c.h"

#include <stdio.h>
#include <stdlib.h>

character getc(character& ch)
{
  ch = getchar();
  return ch;
}

void putc(character ch)
{
  putchar(ch);
}

boolean isdigit(character c)
{
  return '0' <= c && c <= '9';
}

boolean islower(character c)
{
  return 'a' <= c && c <= 'z';
}

boolean isupper(character c)
{
  return 'A' <= c && c <= 'Z';
}

boolean isletter(character c)
{
  return islower(c) || isupper(c);
}

boolean isalphanum(character c)
{
  return isletter(c) || isdigit(c);
}

void error(const char* message)
{
  fprintf(stderr, "%s\n", message);
  exit(EXIT_FAILURE);
}

int g_argc;
const char** g_argv;

boolean getarg(integer n, string& s, integer maxs)
{
  if (n < 1 || n >= g_argc)
    return false;

  // string is 1-based
  const char* arg = g_argv[n];
  int j = 1;
  for (int i = 0; arg[i] != '\0' && j < maxs; ++i)
    s[j++] = arg[i];
  s[j] = ENDSTR;
  return true;
}

#ifdef MAIN
void MAIN();

int main(int argc, const char* argv[])
{
  g_argc = argc;
  g_argv = argv;
  MAIN();
}
#endif
