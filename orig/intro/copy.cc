#include "../p2c.h"
#include "intro.h"

// copy -- copy input to output
void copy()
{
    character c;

    while (getc(c) != ENDFILE)
        putc(c);
}
