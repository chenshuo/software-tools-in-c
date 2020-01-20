#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// getword -- get word from s[i] into out
integer getword(string& s, integer i, string& out)
{
    integer j;

    while (s[i] in[BLANK, TAB, NEWLINE])
        i = i + 1;
    j = 1;
    while (not(s[i] in[ENDSTR, BLANK, TAB, NEWLINE])) {
        out[j] = s[i];
        i = i + 1;
        j = j + 1;
    }
    out[j] = ENDSTR;
    if (s[i] == ENDSTR)
        return 0;
    else
        return i;
}
