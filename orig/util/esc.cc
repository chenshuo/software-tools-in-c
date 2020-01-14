#include "../p2c.h"
#include "util.h"

// esc -- map s[i] into escaped character, increment i
character esc(string& s, integer& i)
{
    if (s[i] != ESCAPE)
        return s[i];
    else if (s[i + 1] == ENDSTR)  // @ not special at end
        return ESCAPE;
    else {
        i = i + 1;
        if (s[i] == ord('n'))
            return NEWLINE;
        else if (s[i] == ord('t'))
            return TAB;
        else
            return s[i];
    }
}
