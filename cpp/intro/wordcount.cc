// wordcount -- count words in standard input
#include <ctype.h>
#include <stdio.h>

int main()
{
    size_t nw = 0;
    bool inword = false;
    int c;

    while ( (c = getchar()) != EOF)
        if (isspace(c))
            inword = false;
        else if (!inword) {
            inword = true;
            ++nw;
        }

    printf("%zd\n", nw);
}
