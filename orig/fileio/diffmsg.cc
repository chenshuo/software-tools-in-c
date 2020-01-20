#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// diffmsg -- print line numbers and differing lines
void diffmsg(integer n, string& line1, string& line2)
{
    putdec(n, 1);
    putc(COLON);
    putc(NEWLINE);
    putstr(line1, STDOUT);
    putstr(line2, STDOUT);
}
