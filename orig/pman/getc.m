{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM getc get a character from standard input
.SY
.UL "function getc (var c : character) : character;"
.FU
.UL getc
reads at most one character from the standard input
.UL STDIN .
If there are no more characters available,
.UL getc
returns
.UL ENDFILE ;
if the input is at end-of-line, it returns
.UL NEWLINE
and advances to the beginning of the next line;
otherwise it returns the next input character.
.RE
.UL getc
returns the value of type
.UL character
corresponding to the character read from the standard input, or one
of the special values
.UL NEWLINE
or
.UL ENDFILE
as specified above.
The return value is also written in the argument
.UL c .
