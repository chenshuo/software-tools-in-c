#include "../p2c.h"
#include "intro.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// copy -- copy input to output
void copy()
{
    character c;

    while (getc(c) != ENDFILE)
        putc(c);
}
