#include "../p2c.h"
#include "filters.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// compress -- compress standard input
void compress()
{
    const int WARNING = TILDE;  // ~
    character c, lastc;
    integer n;

    n = 1;
    lastc = getc(lastc);
    while (lastc != ENDFILE) {
        if (getc(c) == ENDFILE) {
            if ((n > 1) or (lastc == WARNING))
                putrep(n, lastc);
            else
                putc(lastc);
        } else if (c == lastc)
            n = n + 1;
        else if ((n > 1) or (lastc == WARNING)) {
            putrep(n, lastc);
            n = 1;
        } else
            putc(lastc);
        lastc = c;
    }
}
