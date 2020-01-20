#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// compare (simple version) -- compare two files for equality
void compare()
{
    string line1, line2;
    integer lineno;
    boolean f1, f2;

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
