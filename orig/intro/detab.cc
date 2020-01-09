#include "../p2c.h"

void detab()
{
    character c;
    integer col;
    tabtype tabstops;

    settabs(tabstops);
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
