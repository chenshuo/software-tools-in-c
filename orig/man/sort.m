{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM sort sort text lines
.SY
.UL "sort"
.FU
.UL sort
sorts its input into ascending lexicographic order.
Two lines are in order if they are identical or if the leftmost character
position in which they differ contains characters which are in order,
using the internal numeric representation of the characters.
If a line is a proper prefix of another line, it precedes that line in
sort order.
.IP
.UL sort
writes intermediate data to files
named
.UL stemp #,
where # is a small decimal digit string;
these filenames should be avoided.
.EG
To print the sorted output of a program:
.Q1
program | sort | print
.Q2
