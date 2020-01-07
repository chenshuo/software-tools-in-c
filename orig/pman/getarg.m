{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM getarg get a command line argument
.SY
.UL "function getarg (n : integer; var str : string; maxsize : integer)"
.br
.UL "			: boolean;"
.FU
.UL getarg
writes up to
.UL maxsize
characters (including an
.UL ENDSTR )
of the
.UL n th
command line argument
into the string
.UL str .
The first argument on the command line is argument
number one.
No error is reported if the argument string is truncated.
.RE
.UL getarg
returns
.UL true
if the argument is present, otherwise
.UL false .
