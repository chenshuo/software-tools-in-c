{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM putstr put a string on a file
.SY
.Q1
	s : string;
	fd : filedesc;

	putstr(s, fd);
.Q2
.FU
.UL putstr
puts the string
.UL s
on the specified file descriptor.
.IP
.UL putstr
and
.UL putcf
calls may be interleaved.
.BU
There is no explicit error mechanism.
.br
The behavior of
.UL putstr
is undefined if the converted value of
any character
is not in the standard character set.
