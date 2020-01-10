#pragma once

#include <stdint.h>

const int ENDFILE = -1;
const int MAXSTR = 100;  // longest possible string
const int MAXLINE = 1000;

using boolean = bool;
using character = char;  // or int ?
using integer = int32_t;
using string = character[MAXSTR + 1];

const char BACKSPACE = '\b';
const char TAB = '\t';
const char NEWLINE = '\n';
const char BLANK = ' ';
const char TILDE = '~';
const char PLUS = '+';

//
// Built-ins
//

inline int ord(char c) { return c; }

//
// Primitives
//

// getarg -- copy n-th command line argument into s
boolean getarg(integer n, string& s, integer maxs);

// getc -- get one character from standard input
character getc(character& ch);

// putc -- put one character on standard output
void putc(character ch);

// length -- compute length of string
integer length(string& s);

//
// Util functions
//

// isupper -- true if c is upper case letter
boolean isupper(character c);

// min -- compute minimum of two integers
integer min(integer x, integer y);

// max -- compute maximum of two integers
integer max(integer x, integer y);

// putdec -- put decimal integer n in field width >= w
void putdec(integer n, integer w);
