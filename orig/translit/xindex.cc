#include "../p2c.h"
#include "translit.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// xindex -- conditionally invert value from index
integer xindex(string& inset, character c, boolean allbut, integer lastto)
{
    if (c == ENDFILE)
        return 0;
    else if (not allbut)
        return index(inset, c);
    else if (index(inset, c) > 0)
        return 0;
    else
        return lastto + 1;
}
