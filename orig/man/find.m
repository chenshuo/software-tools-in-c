{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM find find patterns in text
.SY
.UL "find pattern"
.FU
.UL find
reads its input a line at a time and writes to its output those
lines that match the specified text pattern.
A text pattern is a concatenation of the following elements:
.Q1
.if t .ta .5i
.if n .ta 12
\f2c\fP	\f1literal character\fP \f2c\fP
?	\f1any character except newline\fP
%	\f1beginning of line\fP
$	\f1end of line (null string before newline)\fP
[...]	\f1character class (any one of these characters)\fP
[^...]	\f1negated character class (all but these characters)\fP
*	\f1closure (zero or more occurrences of previous pattern)\fP
@\f2c\fP	\f1escaped character (e.g., \fP@%\f1, \fP@[\f1, \fP@*\f1)\fP
.Q2
Special meaning of characters in a text pattern is lost when escaped, inside
.UL [...]
(except
.UL @] ),
or for:
.Q1
.if t .ta .5i
.if n .ta 12
%	\f1not at beginning\fP
$	\f1not at end\fP
*	\f1at beginning\fP
.Q2
.IP
A character class consists of zero or more of the following elements,
surrounded by
.UL [
and
.UL ] :
.Q1
.if t .ta .5i
.if n .ta 12
\f2c\f8	\f1literal character \f2c\f1, including \f8[
\f2c1\-c2\fP	\f1range of characters (digits, lower or upper case letters)\fP
^	\f1negated character class if at beginning\fP
@\f2c\fP	\f1escaped character (e.g., \fP@^ @- @@ @]\f1)\fP
.Q2
Special meaning of characters in a character class is lost when escaped or for:
.Q1
.if t .ta .5i
.if n .ta 12
^	\f1not at beginning\fP
-	\f1at beginning or end\fP
.Q2
.IP
An escape sequence consists of the character
.UL @
followed by a single character:
.Q1
.if t .ta .5i
.if n .ta 12
@n	\f1newline\fP
@t	\f1tab\fP
@\f2c\fP	\f2c\fP\f1 (including \fP@@\f1)\fP
.Q2
.EG
To print lines ending in a Pascal keyword or identifier:
.Q1
find [a-zA-Z][a-zA-Z0-9]*$
.Q2
