{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM makecopy copy a file to new file
.SY
.UL "makecopy old new"
.FU
.UL makecopy
copies the file
.UL old
to a new instance of the file
.UL new ,
i.e., if
.UL new
already exists it is truncated and rewritten, otherwise it is made to exist.
The new file is an exact replica of the old.
.EG
To make a backup copy of a precious file:
.Q1
makecopy precious backup
.Q2
.BU
Copying a file onto itself is very system dependent and usually disastrous.
