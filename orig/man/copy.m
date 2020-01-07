{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM copy copy input to output
.SY
.UL copy
.FU
.UL copy
copies its input to its output unchanged.
It is useful for copying from a terminal to a file, from file to file,
or even from terminal to terminal.
It may be used for displaying the contents of a file, without interpretation
or formatting, by copying from a file to terminal.
.EG
To echo lines typed at your terminal:
.Q1
copy
hello there, are you listening?
.S "hello there, are you listening?"
yes, I am.
.S "yes, I am."
<ENDFILE>
.Q2
