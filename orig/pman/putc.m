{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM putc put a character on standard output
.SY
.UL "procedure putc (c : character);"
.FU
.UL putc
writes the character
.UL c
to the standard output
.UL STDOUT ;
if the value of the argument
.UL c
is
.UL NEWLINE ,
an appropriate end-of-line condition is generated.
.RE
Nothing.
