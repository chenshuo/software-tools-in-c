#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// makecopy -- copy one file to another
void makecopy()
{
    string inname, outname;
    filedesc fin, fout;

    if ((not getarg(1, inname, MAXSTR))
        or (not getarg(2, outname, MAXSTR)))
        error("usage: makecopy old new");
    fin = mustopen(inname, IOREAD);
    fout = mustcreate(outname, IOWRITE);
    fcopy(fin, fout);
    close(fin);
    close(fout);
}
