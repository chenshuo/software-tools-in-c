{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM create make a new instance of a file available
.SY
.UL "function create (name : string; mode : integer) : filedesc;"
.FU
.UL create
makes the file with external name
.UL name
available for the type of access specified by
.UL mode ,
by placing it under control of a file descriptor.
If the file already exists, it is truncated to zero length,
otherwise it is introduced as a new zero length file.
In general, the only sensible value of
.UL mode
is
.UL IOWRITE ,
for write access.
.IP
The file remains under control of the file descriptor returned until
explicitly disconnected by a
.UL close
call, or until the program terminates.
.RE
.UL create
returns
.UL IOERROR
if the file cannot be accessed as desired, for any reason;
otherwise it returns a value of type
.UL filedesc
suitable for use with subsequent calls to
.UL close ,
.UL putcf ,
.UL putstr ,
or
.UL seek .
