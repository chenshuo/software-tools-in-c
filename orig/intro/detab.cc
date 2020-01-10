#include "../p2c.h"
#include "intro.h"

// detab -- convert tabs to equivalent number of blanks
void detab()
{
    const int MAXLINE = 1000;  // or whatever
    using tabtype = boolean[MAXLINE + 1];
    character c;
    integer col;
    tabtype tabstops;

    settabs(tabstops);  // set initial tab stops
    col = 1;
    while (getc(c) != ENDFILE)
        if (c == TAB)
            do {
                putc(BLANK);
                col = col + 1;
            } while (not(tabpos(col, tabstops)));
        else if (c == NEWLINE) {
            putc(NEWLINE);
            col = 1;
        } else {
            putc(c);
            col = col + 1;
        }
}
