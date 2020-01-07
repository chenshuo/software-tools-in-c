{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM putc,\ putcf put one character on output
.SY
.Q1
	c : character;
	fd : filedesc;

	putc(c);
	putcf(c, fd);
.Q2
.FU
.UL putc
and
.UL putcf
output a single
.UL character
onto
.UL STDOUT
or the named file descriptor respectively.
.UL NEWLINE
is converted into an appropriate action
by calling
.UL writeln
or its logical equivalent.
.BU
There is no explicit error mechanism.
.br
The behavior of
.UL putc
and
.UL putcf
is undefined if the converted value of
.UL c
is not a character in the standard character set.
