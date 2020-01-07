{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM translit transliterate characters
.SY
.UL "translit [^]src [dest]"
.FU
.UL translit
maps its input, on a character by character basis, and writes the
translated version to its output.
In the simplest case, each character in the argument
.UL src
is translated to the corresponding character in the argument
.UL dest ;
all other characters are copied as is.
Both
.UL src
and
.UL dest
may contain substrings of the form
.IT c1-c2
as shorthand for all of the characters in the range
.IT c1..c2 .
.IT c1
and
.IT c2
must both be digits, or both be letters of the same case.
.IP
If
.UL dest
is absent, all characters represented by
.UL src
are deleted.
Otherwise, if
.UL dest
is shorter than
.UL src ,
all characters in
.UL src
that would map to or beyond the last character in
.UL dest
are mapped to the last character in
.UL dest ;
moreover adjacent instances of such characters in the input are
represented in the output by a single instance of the last character in
.UL dest .
Thus
.Q1
translit 0-9 9
.Q2
converts each string of digits to the single digit
.UL 9 .
.IP
Finally, if
.UL src
is preceded by a
.UL ^ ,
then
.ul
all but
the characters represented by
.UL src
are taken as the source string;
i.e., they are all deleted if
.UL dest
is absent, or they are all collapsed if the last character in
.UL dest
is present.
.EG
To convert upper case to lower:
.Q1
translit A-Z a-z
.Q2
.IP
To discard punctuation and isolate words by spaces on each line:
.Q1
translit ^a-zA-Z@n " "
This is a simple-minded test, i.e., a test of translit.
.S "This is a simple minded test i e a test of translit"
.Q2
