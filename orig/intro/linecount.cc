#include "../p2c.h"
#include "intro.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// linecount -- count lines in standard input
void linecount()
{
    integer nl;
    character c;

    nl = 0;
    while (getc(c) != ENDFILE)
        if (c == NEWLINE)
            nl = nl + 1;
    putdec(nl, 1);
    putc(NEWLINE);
}
