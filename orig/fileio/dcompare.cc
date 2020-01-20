#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// dcompare -- drive simple version of compare
void dcompare()
{
    string arg1, arg2;
    filedesc infile1, infile2;

    if ((not getarg(1, arg1, MAXSTR))
        or (not getarg(2, arg2, MAXSTR)))
        error("usage: compare file1 file2");
    infile1 = mustopen(arg1, IOREAD);
    infile2 = mustopen(arg2, IOREAD);
    compare();
}
