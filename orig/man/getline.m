{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM getline get one line from file
.SY
.Q1
	s : string;
	b : boolean;
	fd : filedesc;

	b := getline(s, fd, MAXSTR);
.Q2
.FU
.UL getline
returns the next line from the specified file descriptor
in the string
.UL s .
.UL b
is
.UL true
if any data was returned, and 
.UL false
for end of file.
.UL getline
returns at most
.UL MAXSTR-1
characters plus a terminating
.UL ENDSTR ;
thus if
.UL s[length(s)]
is not a 
.UL NEWLINE ,
the input line was too long.
.IP
.UL getline
and
.UL getcf
calls may be interleaved.
.BU
There is no explicit error mechanism.
.br
Behavior of calls after the first
.UL ENDFILE
is undefined.
