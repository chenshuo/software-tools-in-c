#include "../p2c.h"
#include "util.h"

// min -- compute minimum of two integers
integer min(integer x, integer y)
{
    if (x < y)
        return x;
    else
        return y;
}
