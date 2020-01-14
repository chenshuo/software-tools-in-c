#include "../p2c.h"
#include "util.h"

// addstr -- put c in outset[j] if it fits, increment j
boolean addstr(character c, string& outset, integer& j, integer maxset)
{
    if (j > maxset)
        return false;
    else {
        outset[j] = c;
        j = j + 1;
        return true;
    }
}
