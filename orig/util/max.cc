#include "../p2c.h"
#include "util.h"

// max -- compute maximum of two integers
integer max(integer x, integer y)
{
    if (x > y)
        return x;
    else
        return y;
}
