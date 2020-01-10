#include "../p2c.h"
#include "filters.h"

// entab -- replace blanks by tabs and blanks
void entab()
{
    const int MAXLINE = 1000;  // or whatever
    using tabtype = boolean[MAXLINE + 1];
    character c;
    integer col, newcol;
    tabtype tabstops;

    settabs(tabstops);
    col = 1;
    do {
        newcol = col;
        while (getc(c) == BLANK) {  // collect blanks
            newcol = newcol + 1;
            if (tabpos(newcol, tabstops)) {
                putc(TAB);
                col = newcol;
            }
        }
        while (col < newcol) {
            putc(BLANK);  // output leftover blanks
            col = col + 1;
        }
        if (c != ENDFILE) {
            putc(c);
            if (c == NEWLINE)
                col = 1;
            else
                col = col + 1;
        }
    } while (not(c == ENDFILE));
}
