#include "../p2c.h"
#include "translit.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// translit -- map characters
void translit()
{
    const int NEGATE = CARET;  // ^
    string arg, fromset, toset;
    character c;
    int /* 0 .. MAXSTR */ i, lastto;
    boolean allbut, squash;

    if (not getarg(1, arg, MAXSTR))
        error("usage: translit from to");
    allbut = (arg[1] == NEGATE);
    if (allbut)
        i = 2;
    else
        i = 1;
    if (not makeset(arg, i, fromset, MAXSTR))
        error("translit: \"from\" set too large");
    if (not getarg(2, arg, MAXSTR))
        toset[1] = ENDSTR;
    else if (not makeset(arg, 1, toset, MAXSTR))
        error("translit: \"to\" set too large");
    else if (length(fromset) < length(toset))
        error("translit: \"from\" shorter than \"to\"");
    lastto = length(toset);
    squash = (length(fromset) > lastto) or (allbut);
    do {
        i = xindex(fromset, getc(c), allbut, lastto);
        if ((squash) and (i >= lastto) and (lastto > 0)) {
            putc(toset[lastto]);
            do {
                i = xindex(fromset, getc(c), allbut, lastto);
            } while (not(i < lastto));
        }
        if (c != ENDFILE) {
            if ((i > 0) and (lastto > 0))  // translate
                putc(toset[i]);
            else if (i == 0)  // copy
                putc(c);
        }
    } while (not(c == ENDFILE));
}
