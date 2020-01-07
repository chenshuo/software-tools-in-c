{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM overstrike replace overstrikes by multiple lines
.SY
.UL "overstrike"
.FU
.UL overstrike
copies its input to its output, replacing lines containing backspaces
by multiple lines that overstrike to print the same as the input,
but contain no backspaces.
It is assumed that the output is to be printed on a device that takes the
first character of each line as a carriage control;
a blank carriage control causes normal space before print, while a
plus sign
.UL + ' `
suppresses space before print and hence causes the remainder
of the line to overstrike the previous line.
.EG
Using
.UL \(<-
as a visible backspace:
.Q1
overstrike
abc\(<-\(<-\(<-___
.S " abc"
.S "+___"
.Q2
.BU
.UL overstrike
is naive about vertical motions and non-printing characters.
.br
It produces one overstruck line for each sequence of backspaces.
