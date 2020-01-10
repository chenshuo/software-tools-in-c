#include "../p2c.h"
#include "filters.h"

// settabs -- set initial tab stops
void settabs(tabtype& tabstops)
{
    const int TABSPACE = 4;  // 4 spaces per tab
    integer i;

    for (i = 1; i <= MAXLINE; ++i)
        tabstops[i] = (i % TABSPACE == 1);
}
