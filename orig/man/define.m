{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM define expand string definitions
.SY
.UL "define"
.FU
.UL define
reads its input, looking for macro definitions of the form
.Q1
define(ident, string)
.Q2
and writes its output with each subsequent instance of the identifier
.UL ident
replaced by the sequence of characters
.UL string .
.UL string
must be balanced in parentheses.
The text of each definition proper results in no
output text.
Each replacement string is rescanned for further possible
replacements, permitting multi-level definitions.
.EG
.Q1
define
define(ENDFILE, (-1))
define(DONE, ENDFILE)
    if (getit(line) = DONE) then
        putit(sumline);
<ENDFILE>


.S "    if (getit(line) = (-1)) then"
.S "        putit(sumline);"
.Q2
.BU
A recursive definition such as
.UL define(x,\ x)
will cause an infinite loop
when
.UL x
is invoked.
