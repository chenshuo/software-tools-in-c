#pragma once

#include <stdint.h>

using boolean = bool;
using character = char;  // or int ?
using integer = int32_t;

const int ENDFILE = -1;
const int MAXLINE = 1000;

const char TAB = '\t';
const char NEWLINE = '\n';
const char BLANK = ' ';

//
// Primitives
//

// getc -- get one character from standard input
character getc(character& ch);

// putc -- put one character on standard output
void putc(character ch);

//
// Util functions
//

// putdec -- put decimal integer n in field width >= w
void putdec(integer n, integer w);
