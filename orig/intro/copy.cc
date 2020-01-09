#include "../p2c.h"

void copy()
{
    character c;

    while (getc(c) != ENDFILE)
        putc(c);
}
