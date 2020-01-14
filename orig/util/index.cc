#include "../p2c.h"
#include "util.h"

// index -- find position of character c in string s
integer index(string& s, character c)
{
    integer i;

    i = 1;
    while ((s[i] != c) and (s[i] != ENDSTR))
        i = i + 1;
    if (s[i] == ENDSTR)
        return 0;
    else
        return i;
}
