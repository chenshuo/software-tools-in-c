#include "../p2c.h"
#include "filters.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// echo -- echo command line arguments to output
void echo()
{
    integer i, j;
    string argstr;

    i = 1;
    while (getarg(i, argstr, MAXSTR)) {
        if (i > 1)
            putc(BLANK);
        for (j = 1; j <= length(argstr); ++j)
            putc(argstr[j]);
        i = i + 1;
    }
    if (i > 1)
        putc(NEWLINE);
}
