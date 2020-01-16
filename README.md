# Software Tools in C/C++

C/C++ source code for _Software Tools in Pascal_ by Kernighan and Plauger, 1981.

This repository consists of two parts:
1. A customized Pascal-to-C converter written in Java using ANTLR4, located in `p2c/`
2. Rewrite of the tools in C, in `cpp/`

The converted code is mostly C, but use a tiny bit of C++11 syntax like
passing-by-reference for Pascal's [Variable_parameter](https://wiki.freepascal.org/Variable_parameter),
and `using` for type aliases.

To run the first part,

```shell
make convert
```

and check Pascal and C++ code in `orig/`

To run the second part,

```shell
make tests
```

which builds C++ code in `cpp/` to binaries in `bin/` and run some tests written in Python.

Example:

Original Pascal code of `orig/intro/wordcount.p`:

```pascal
{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ wordcount -- count words in standard input }
procedure wordcount;
var
    nw : integer;
    c : character;
    inword : boolean;
begin
    nw := 0;
    inword := false;
    while (getc(c) <> ENDFILE) do
        if (c = BLANK) or (c = NEWLINE) or (c = TAB) then
            inword := false
        else if (not inword) then begin
            inword := true;
            nw := nw + 1
        end;
    putdec(nw, 1);
    putc(NEWLINE)
end;
```

Converted literally to C++ in `orig/intro/wordcount.cc`:

```c++
// Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd.
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
```

Rewrite in C as `cpp/intro/wordcount.cc`:

```c++
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
```

**Progress**

1. The `p2c` converter is almost done.
2. The following directories has been made working:
    * `intro/` from Chapter 1, mostly rewritten.
    * `filters/` from Chapter 2, only rewrote `echo`.
    * `translit/` from Chapter 2, with original code.

