#include "../p2c.h"

boolean tabpos(integer col, tabtype& tabstops)
{
    if (col > MAXLINE)
        tabpos = true;
    else
        tabpos = tabstops[col];
}
