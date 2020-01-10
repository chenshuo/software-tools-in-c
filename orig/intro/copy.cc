#include "../p2c.h"
#include "intro.h"

void copy()
{
    character c;

    while (getc(c) != ENDFILE)
        putc(c);
}
