#include "../p2c.h"
#include "intro.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// tabpos -- return true if col is a tab stop
boolean tabpos(integer col, tabtype& tabstops)
{
    if (col > MAXLINE)
        return true;
    else
        return tabstops[col];
}
