{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM nargs get number of command line arguments
.SY
.UL "function nargs : integer;"
.FU
.UL nargs
determines the number of arguments used on the command line
that invoked the program,
suitable for copying by
.UL getarg .
.RE
.UL nargs
returns the number of arguments found on the command line, i.e., a number
greater than or equal to zero.
