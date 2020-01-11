// charcount -- count characters in standard input
#include <stdio.h>

int main()
{
    size_t nc = 0;
    while (getchar() != EOF)
        ++nc;
    printf("%zd\n", nc);
}
