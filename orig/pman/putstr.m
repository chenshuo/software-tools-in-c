{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM putstr put string in a file
.SY
.UL "procedure putstr (var str : string; fd : filedesc);"
.FU
.UL putstr
writes the characters in
.UL str ,
up to but not including the terminating
.UL ENDSTR ,
to the file 
specified by file descriptor
.UL fd .
An unsuccessful write may or may not cause a warning message or
early termination of the program.
.RE
Nothing.
