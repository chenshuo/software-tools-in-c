// detab -- convert tabs to equivalent number of blanks
#include <stdio.h>

const int TABSPACE = 4;

int main()
{
    int col = 0;
    int c;

    while ( (c = getchar()) != EOF)
        if (c == '\t') {
            do {
                putchar(' ');
                col = col + 1;
            } while (col % TABSPACE != 0);
        } else {
            putchar(c);
            if (c == '\n')
                col = 0;
            else
                ++col;
        }
}
