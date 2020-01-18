#pragma once

#include <stdint.h>

const int ENDFILE = -1;
const char ENDSTR = '\0';
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
const char MINUS = '-';
const char DASH = MINUS;
const char ATSIGN = '@';
const char ESCAPE = ATSIGN;
const char CARET = '^';

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

// index -- find position of character c in string s
integer index(string& s, character c);

void error(const char* message) __attribute__ ((noreturn));

//
// Util functions
//

// isalphanum -- true if c is letter or digit
boolean isalphanum(character c);

// isdigit -- true if c is a digit
boolean isdigit(character c);

// isletter -- true if c is a letter of either case
boolean isletter(character c);

// islower -- true if c is lower case letter
boolean islower(character c);

// isupper -- true if c is upper case letter
boolean isupper(character c);

// min -- compute minimum of two integers
integer min(integer x, integer y);

// max -- compute maximum of two integers
integer max(integer x, integer y);

// putdec -- put decimal integer n in field width >= w
void putdec(integer n, integer w);

// addstr -- put c in outset[j] if it fits, increment j
boolean addstr(character c, string& outset, integer& j, integer maxset);

// esc -- map s[i] into escaped character, increment i
character esc(string& s, integer& i);

// scopy -- copy string at src[i] to dest[j]
void scopy(string& src, integer i, string& dest, integer j);
