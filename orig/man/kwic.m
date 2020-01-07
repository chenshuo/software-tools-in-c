{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM kwic produce lines for KWIC index
.SY
.UL "kwic"
.FU
.UL kwic
writes one or more ``folded''
versions of each input line to its output.
A line is ``folded'' at the beginning of each alphanumeric string within
the line by writing from that string through the end of the line, followed
by the fold character
.UL $ ,
followed by the beginning of the line.
.IP
.UL kwic
is used with
.UL sort
and
.UL unrotate
to produce a KeyWord In Context, or KWIC, index.
.EG
.Q1
kwic
This is a test.
.S "This is a test.$"
.S "is a test.$This"
.S "a test.$This is"
.S "test.$This is a"
.Q2
Normal usage is
.Q1
kwic <document | sort | unrotate
.Q2
