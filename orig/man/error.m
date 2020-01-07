{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.ds n PRIMITIVE
.NM error,\ message print diagnostic message on STDERR
.SY
.Q1
	s : packed array [1..\f2n\fP] of char;

	error(s);
	message(s);
.Q2
.FU
.UL error
and
.UL message
write their single argument on
.UL STDERR .
.UL message
returns,
.UL error
terminates execution of the program.
