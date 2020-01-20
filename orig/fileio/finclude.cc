#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// finclude -- include file desc f
void finclude(filedesc f)
{
    string line, str;
    integer loc, i;
    filedesc f1;

    while (getline(line, f, MAXSTR)) {
        loc = getword(line, 1, str);
        if (not equal(str, incl))
            putstr(line, STDOUT);
        else {
            loc = getword(line, loc, str);
            str[length(str)] = ENDSTR;  // remove quotes
            for (i = 1; i <= length(str); ++i)
                str[i] = str[i + 1];
            f1 = mustopen(str, IOREAD);
            finclude(f1);
            close(f1);
        }
    }
}
