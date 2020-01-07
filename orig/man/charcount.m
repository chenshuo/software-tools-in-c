{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM charcount count characters in input
.SY
.UL "charcount"
.FU
.UL charcount
counts the characters in its input and writes the total as a single
line of text to the output.
Since each line of text is internally delimited by a
.UL NEWLINE
character, the total count is the number of lines plus the number of characters
within each line.
.EG
.Q1
charcount
A single line of input.
<ENDFILE>
.S 24
.Q2
