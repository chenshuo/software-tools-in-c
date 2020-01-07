{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM getline get a line of text from a file
.SY
.UL "function getline (var str : string; fd : filedesc;"
.br
.UL "			maxsize : integer) : boolean;"
.FU
.UL getline
reads at most one line of text from the file
specified by file descriptor
.UL fd .
The characters are written into
.UL str
up to and including the terminating
.UL NEWLINE ;
an
.UL ENDSTR
is then appended to the input text.
No more than
.UL maxsize- 1
characters are returned,
so a line of length
.UL maxsize- 1
that does not end with
.UL NEWLINE
has been truncated.
.RE
.UL getline
returns
.UL true
if a line is successfully obtained;
.UL false
implies end of file.
