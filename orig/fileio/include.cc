#include "../p2c.h"
#include "fileio.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// include -- replace #include "file" by contents of file
void include()
{
    string incl;
    // value is '#include'
    // setstring(incl, '#include');
    incl[1] = ord('#');
    incl[2] = ord('i');
    incl[3] = ord('n');
    incl[4] = ord('c');
    incl[5] = ord('l');
    incl[6] = ord('u');
    incl[7] = ord('d');
    incl[8] = ord('e');
    incl[9] = ENDSTR;
    finclude(STDIN);
}
