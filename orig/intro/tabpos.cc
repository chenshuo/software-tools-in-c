#include "../p2c.h"
#include "intro.h"

boolean tabpos(integer col, tabtype& tabstops)
{
    if (col > MAXLINE)
        return true;
    else
        return tabstops[col];
}
