{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM wordcount count words in input
.SY
.UL wordcount
.FU
.UL wordcount
counts the words in its input and writes the total as a line of
text to the output.
A ``word'' is a maximal sequence of characters not
containing a blank or tab or newline.
.EG
.Q1
wordcount
A single line of input.
<ENDFILE>
.S 5
.Q2
.BU
The definition of ``word'' is simplistic.
