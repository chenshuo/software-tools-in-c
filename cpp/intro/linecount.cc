#include <stdio.h>

int main()
{
    size_t nl = 0;
    int c;

    while ( (c = getchar()) != EOF)
        if (c == '\n')
            ++nl;

    printf("%zd\n", nl);
}
