{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM putcf put a character in a file
.SY
.UL "procedure putcf (c : character; fd : filedesc);"
.FU
.UL putcf
writes the character
.UL c
to the file
specified by file descriptor
.UL fd ;
if the value of
.UL c
is
.UL NEWLINE ,
an appropriate end-of-line condition is generated.
.RE
Nothing.
