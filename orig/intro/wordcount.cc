#include "../p2c.h"
#include "intro.h"

// wordcount -- count words in standard input
void wordcount()
{
    integer nw;
    character c;
    boolean inword;

    nw = 0;
    inword = false;
    while (getc(c) != ENDFILE)
        if ((c == BLANK) or (c == NEWLINE) or (c == TAB))
            inword = false;
        else if (not inword) {
            inword = true;
            nw = nw + 1;
        }
    putdec(nw, 1);
    putc(NEWLINE);
}
