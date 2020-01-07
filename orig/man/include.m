{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM include include copies of subfiles
.SY
.UL "include"
.FU
.UL include
copies its input to its output unchanged, except that each
line beginning
.Q1
#include "filename"
.Q2
is replaced by the contents of the file whose name is
.UL filename .
.UL include d
files may contain further
.UL #include
lines, to arbitrary depth.
.EG
To piece together a Pascal program such as
.UL include :
.Q1
#include "include.p"
.Q2
.BU
A file that includes itself will not be diagnosed, but will eventually
cause something to break.
