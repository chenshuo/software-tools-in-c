#include "../p2c.h"

void settabs(tabtype& tabstops)
{
    integer i;

    for (i = 1; i <= MAXLINE; ++i)
        tabstops[i] = (i % TABSPACE == 1);
}
