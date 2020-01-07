{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM seek position file access pointer
.SY
.UL "procedure seek (recno : integer; fd : filedesc);"
.FU
.UL seek
positions the file controlled by
.UL fd
so that a subsequent
.UL read
or
.UL write
call will access the record whose ordinal number is
.UL recno .
Records are presumed to be of type
.UL string ;
the first record is number one.
.RE
Nothing.
.BU
Our version of this primitive is far from general, having been written just
to satisfy the needs of one form of the program
.UL edit .
It assumes a system that can support simultaneous read and write
access to the same file.
