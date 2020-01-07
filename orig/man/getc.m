{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM getc,\ getcf get one character from input
.SY
.Q1
	c, c1 : character;
	fd : filedesc;

	c := getc(c1);
	c := getcf(c1, fd);
.Q2
.FU
.UL getc
and
.UL getcf
return a single
.UL character
from
.UL STDIN
or the named file descriptor respectively.
The value is also returned through the
.UL c1
argument.
.UL ENDFILE
is returned the first time
that end of file is encountered.
.UL NEWLINE
is returned at the end of each line.
.BU
There is no explicit error mechanism.
.br
Behavior of calls after the first
.UL ENDFILE
is undefined.
