{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM echo echo arguments to output
.SY
.UL "echo [ argument ... ]"
.FU
.UL echo
copies its command line arguments to its output as a line
of text with one space between each argument.
If there are no arguments, no output is produced.
.EG
To see if your system is alive:
.Q1
echo hello world!
.S "hello world!"
.Q2
