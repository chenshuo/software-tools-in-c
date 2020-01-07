{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM macro expand string definitions, with arguments
.SY
.UL "macro"
.FU
.UL macro
reads its input, looking for macro definitions of the form
.Q1
    define(ident,string)
.Q2
and writes its output with each subsequent instance of the identifier
.UL ident
replaced by the arbitrary sequence of characters
.UL string .
.IP
Within a replacement string, any dollar sign
.UL $
followed by a digit is replaced by an argument corresponding to that digit.
Arguments are written as a parenthesized list of strings following an
instance of the identifier, e.g.,
.Q1
ident(arg1,arg2,...)
.Q2
So
.UL $1
is replaced in the replacement string by
.UL arg1 ,
.UL $2
by
.UL arg2 ,
and so on;
.UL $0
is replaced by
.UL ident .
Missing arguments are taken as null strings;
extra arguments are ignored.
.IP
The replacement string in a definition is expanded before the definition
occurs, except that any sequence of characters between a grave
.UL `
and a balancing apostrophe
.UL '
is taken literally, with the grave and apostrophe removed.
Thus, it is possible to make an alias for define by writing
.Q1
    define(def,`define($1,$2)')
.Q2
.IP
Additional predefined built-ins
are:
.IP
.UL ifelse(a,b,c,d)
is replaced by the string
.UL c
if the string
.UL a
exactly matches the string
.UL b ;
otherwise it is replaced by the string
.UL d .
.IP
.UL expr(expression)
is replaced by the decimal string representation of the numeric value of
.UL expression .
For correct operation, the expression must consist of
parentheses, integer operands written as decimal digit strings, and
the operators
.UL + ,
.UL - ,
.UL * ,
.UL /
(integer division), and
.UL %
(remainder).
Multiplication and division bind tighter than addition and subtraction,
but parentheses may be used to alter this order.
.IP
.UL substr(s,m,n)
is replaced by the substring of
.UL s
starting at location
.UL m
(counting from one)
and continuing at most
.UL n
characters.
If
.UL n
is omitted, it is taken as a very large number;
if
.UL m
is outside the string, the replacement string is null.
.UL m
and
.UL n
may be expressions suitable for
.UL expr .
.IP
.UL len(s)
is replaced by the string representing the length of its argument
in characters.
.IP
.UL changeq(xy)
changes the quote characters
to
.UL x
and
.UL y .
.UL changeq()
changes them back to
.UL `
and
.UL ' .
.IP
Each replacement string is rescanned for further possible
replacements, permitting multi-level definitions to be expanded to final
form.
.EG
The macro
.UL len
could be written in terms of the other built-ins as:
.Q1
define(`len',`ifelse($1,,0,`expr(1+len(substr($1,2)))')')
.Q2
.BU
A recursive definition of the form
.UL define(x,x)
will cause an infinite loop.
.br
Expression evaluation is fragile.
There is no unary minus.
.br
It is unwise to use parentheses as quote characters.
