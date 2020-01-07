{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM change change patterns in text
.SY
.UL "change pattern [newstuff]"
.FU
.UL change
copies its input to its output except that
each non-overlapping string that matches
.UL pattern
is replaced by the string
.UL newstuff .
A non-existent
.UL newstuff
implies deletion of the matched string.
The patterns accepted by
.UL change
are the same as those used by
.UL find .
.IP
The replacement string
.UL newstuff
consists of zero or more of the following elements:
.Q1
.if t .ta .5i
.if n .ta 12
\f2c\fP	\f1literal character\fP
&	\f1ditto, i.e., whatever was matched\fP
@\f2c\fP	\f1escaped character \fP\f2c\fP \f1(e.g., \fP@&\f1)\fP
.Q2
.EG
To parenthesize all sums and differences of identifiers:
.Q1
change "[a-zA-Z][a-zA-Z0-9]*[ ]*[+-][ ]*[a-zA-Z][a-zA-Z0-9]*" (&)
.Q2
