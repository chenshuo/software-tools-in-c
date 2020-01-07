{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM remove remove a file
.SY
.UL "procedure remove (name : string);"
.FU
.UL remove
causes the file with external name
.UL name
to be discarded,
i.e., a subsequent call to
.UL open
with the same name will fail and a subsequent
.UL create
will be obliged to make a new instance of the file.
In general, the file to be removed should not be connected to any file
descriptor at the time of the
.UL remove
call.
.RE
Nothing.
