#include "../p2c.h"

void charcount()
{
    integer nc;
    character c;

    nc = 0;
    while (getc(c) != ENDFILE)
        nc = nc + 1;
    putdec(nc, 1);
    putc(NEWLINE);
}
