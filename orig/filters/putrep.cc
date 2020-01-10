#include "../p2c.h"
#include "filters.h"

// putrep -- put out representation of run of n 'c's
void putrep(integer n, character c)
{
    const int MAXREP = 26;  // assuming 'A'..'Z'
    const int THRESH = 4;
    while ((n >= THRESH) or ((c == WARNING) and (n > 0))) {
        putc(WARNING);
        putc(min(n, MAXREP) - 1 + ord('A'));
        putc(c);
        n = n - MAXREP;
    }
    for (n = n; n >= 1; --n)
        putc(c);
}
