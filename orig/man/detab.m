{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM detab convert tabs to blanks
.SY
.UL "detab"
.FU
.UL detab
copies its input to its output, expanding horizontal tabs to blanks along
the way, so that the output is visually the same as the input, but contains
no tab characters.
Tab stops are assumed to be set every four columns
(i.e., 1, 5, 9, ...),
so that each tab
character is replaced by from one to four blanks.
.EG
Using
.UL \(->
as a visible tab:
.Q1
detab
\(->col 1\(->2\(->34\(->rest
.S "    col 1   2   34  rest"
.BU
.UL detab
is naive about backspaces, vertical motions, and non-printing characters.
