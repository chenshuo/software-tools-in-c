#include "../p2c.h"
#include "filters.h"

// tabpos -- return true if col is a tab stop
boolean tabpos(integer col, tabtype& tabstops)
{
    if (col > MAXLINE)
        return true;
    else
        return tabstops[col];
}
