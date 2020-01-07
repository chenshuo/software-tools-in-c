{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM getcf get a character from a file
.SY
.UL "function getcf (var c : character; fd : filedesc) : character;"
.FU
.UL getcf
reads at most one character from the file 
specified by the file descriptor
.UL fd .
If there are no more characters available,
.UL getcf
returns
.UL ENDFILE ;
if the input is at end-of-line, it returns
.UL NEWLINE
and advances to the beginning of the next line;
otherwise it returns the next input character and points past it in the file.
.RE
.UL getcf
returns the value of type
.UL character
corresponding to the character read from the file, or one
of the special values
.UL NEWLINE
or
.UL ENDFILE
as specified above.
The return value is also written in the argument
.UL c .
