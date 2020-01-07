{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM entab convert runs of blanks into tabs
.SY
.UL "entab"
.FU
.UL entab
copies its input to its output, replacing strings of blanks
by tabs so that the output is visually the same as the input, but contains
fewer characters.
Tab stops are assumed to be set every four columns (i.e., 1, 5, 9, ...),
so that each sequence
of one to four blanks ending on a tab stop is replaced by a tab character.
.EG
Using
.UL \(->
as a visible tab:
.Q1
entab
    col 1   2   34  rest
.S "\(->col\(->1\(->2\(->34\(->rest"
.Q2
.BU
.UL entab
is naive about backspaces, vertical motions, and non-printing characters.
.br
.UL entab
will convert a single blank to a tab if it occurs
at a tab stop.
Thus
.UL entab
is not an exact inverse of
.UL detab .
