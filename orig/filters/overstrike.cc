#include "../p2c.h"
#include "filters.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// overstrike -- convert backspaces into multiple lines
void overstrike()
{
    const int SKIP = BLANK;
    const int NOSKIP = PLUS;
    character c;
    integer col, newcol, i;

    col = 1;
    do {
        newcol = col;
        while (getc(c) == BACKSPACE)  // eat backspaces
            newcol = max(newcol - 1, 1);
        if (newcol < col) {
            putc(NEWLINE);  // start overstrike line
            putc(NOSKIP);
            for (i = 1; i <= newcol - 1; ++i)
                putc(BLANK);
            col = newcol;
        } else if ((col == 1) and (c != ENDFILE))
            putc(SKIP);  // normal line
        // else middle of line
        if (c != ENDFILE) {
            putc(c);  // normal character
            if (c == NEWLINE)
                col = 1;
            else
                col = col + 1;
        }
    } while (not(c == ENDFILE));
}
