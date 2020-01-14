#include "../p2c.h"
#include "translit.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// makeset -- make set from inset[k] in outset
boolean makeset(string& inset, integer k, string& outset, integer maxset)
{
    integer j;

    j = 1;
    dodash(ENDSTR, inset, k, outset, j, maxset);
    return addstr(ENDSTR, outset, j, maxset);
}
