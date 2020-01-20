#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// compare -- compare two files for equality
void compare()
{
    string line1, line2;
    string arg1, arg2;
    integer lineno;
    filedesc infile1, infile2;
    boolean f1, f2;

    if ((not getarg(1, arg1, MAXSTR))
        or (not getarg(2, arg2, MAXSTR)))
        error("usage: compare file1 file2");
    infile1 = mustopen(arg1, IOREAD);
    infile2 = mustopen(arg2, IOREAD);
    lineno = 0;
    do {
        lineno = lineno + 1;
        f1 = getline(line1, infile1, MAXSTR);
        f2 = getline(line2, infile2, MAXSTR);
        if (f1 and f2)
            if (not equal(line1, line2))
                diffmsg(lineno, line1, line2);
    } while (not((f1 == false) or (f2 == false)));
    if (f2 and not f1)
        message("compare: end of file on file1");
    else if (f1 and not f2)
        message("compare: end of file on file2");
}
