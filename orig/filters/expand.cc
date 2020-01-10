#include "../p2c.h"
#include "filters.h"

// expand -- uncompress standard input
void expand()
{
    const int WARNING = TILDE;  // ~
    character c;
    integer n;

    while (getc(c) != ENDFILE)
        if (c != WARNING)
            putc(c);
        else if (isupper(getc(c))) {
            n = c - ord('A') + 1;
            if (getc(c) != ENDFILE)
                for (n = n; n >= 1; --n)
                    putc(c);
            else {
                putc(WARNING);
                putc(n - 1 + ord('A'));
            }
        } else {
            putc(WARNING);
            if (c != ENDFILE)
                putc(c);
        }
}
