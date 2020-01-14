#include "../p2c.h"
#include "translit.h"

// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
// dodash - expand set at src[i] into dest[j], stop at delim
void dodash(character delim, string& src, integer& i, string& dest, integer& j, integer maxset)
{
    integer k;
    boolean junk;

    while ((src[i] != delim) and (src[i] != ENDSTR)) {
        if (src[i] == ESCAPE)
            junk = addstr(esc(src, i), dest, j, maxset);
        else if (src[i] != DASH)
            junk = addstr(src[i], dest, j, maxset);
        else if ((j <= 1) or (src[i + 1] == ENDSTR))
            junk = addstr(DASH, dest, j, maxset);
        else  // literal -
            if ((isalphanum(src[i - 1]))
                and (isalphanum(src[i + 1]))
                and (src[i - 1] <= src[i + 1])) {
            for (k = src[i - 1] + 1; k <= src[i + 1]; ++k)
                junk = addstr(k, dest, j, maxset);
            i = i + 1;
        } else
            junk = addstr(DASH, dest, j, maxset);
        i = i + 1;
    }
}
