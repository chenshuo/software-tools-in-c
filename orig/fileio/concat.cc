#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// concat -- concatenate files onto standard output
void concat()
{
    integer i;
    boolean junk;
    filedesc fd;
    string s;

    for (i = 1; i <= nargs; ++i) {
        junk = getarg(i, s, MAXSTR);
        fd = mustopen(s, IOREAD);
        fcopy(fd, STDOUT);
        close(fd);
    }
}
