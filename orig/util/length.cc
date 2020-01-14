#include "../p2c.h"
#include "util.h"

// length -- compute length of string
integer length(string& s)
{
    integer n;

    n = 1;
    while (s[n] != ENDSTR)
        n = n + 1;
    return n - 1;
}
