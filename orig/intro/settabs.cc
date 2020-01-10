#include "../p2c.h"
#include "intro.h"

void settabs(tabtype& tabstops)
{
    const int TABSPACE = 4;
    integer i;

    for (i = 1; i <= MAXLINE; ++i)
        tabstops[i] = (i % TABSPACE == 1);
}
