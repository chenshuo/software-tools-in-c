{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM unrotate format lines for KWIC index
.SY
.UL "unrotate"
.FU
.UL unrotate
reads its input a line at a time and writes an ``unfolded'' version
to its output.
A line is ``folded'' if it contains within it an instance of the fold character
.UL $ ;
``unfolding'' involves writing from the end of the line down to but
not including the fold character, starting in column 39 of the
output line, wrapping characters that would thus appear 
before column 1
around to the end of the line,
then writing the remainder of the line
starting at column 41 and wrapping around at column 80 if necessary.
.IP
.UL unrotate
is used with
.UL kwic
and
.UL sort
to produce a KeyWord In Context, or KWIC, index.
.EG
.Q1
unrotate
a test.$This is
is a test.$This
test.$This is a
This is a test.$
<ENDFILE>
.S "                     This is  a test."
.S "                        This  is a test."
.S "                   This is a  test."
.S "                test.         This is a"
.Q2
