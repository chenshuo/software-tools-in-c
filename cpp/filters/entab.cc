// entab -- replace blanks by tabs and blanks
// BUG: it doesn't work properly if the input has tabs.
#include <stdio.h>

const int TABSPACE = 4;

int main()
{
    int col = 0;
    int c;

    do {
        int newcol = col;
        while ( (c = getchar()) == ' ') {  // collect blanks
            ++newcol;
            if (newcol % TABSPACE == 0) {
                putchar('\t');
                col = newcol;
            }
        }
        while (col < newcol) {
            putchar(' ');  // output leftover blanks
            ++col;
        }
        if (c != EOF) {
            putchar(c);
            if (c == '\n')
                col = 0;
            else
                ++col;
        }
    } while (c != EOF);
}
