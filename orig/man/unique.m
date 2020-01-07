{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM unique delete adjacent duplicate lines
.SY
.UL "unique"
.FU
.UL unique
writes to its output only the first line from each
group of adjacent identical input lines.
It is most useful for text that has been sorted to bring identical lines
together; in this case it passes through only unique instances of input lines.
.EG
To eliminate duplicate lines in the output of a program:
.Q1
program | sort | unique
.Q2
