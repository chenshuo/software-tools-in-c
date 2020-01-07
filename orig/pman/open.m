{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM open make a file available for input or output
.SY
.UL "function open (name : string; mode : integer) : filedesc;"
.FU
.UL open
makes the file with external name
.UL name
available for the type of access specified by
.UL mode .
Legitimate values of
.UL mode
are
.UL IOREAD
for read access
and
.UL IOWRITE 
for write access.
No other values are currently defined.
In either case, the file is not modified by the
.UL open
call, and access commences with the first character of the file.
.IP
The file remains associated with the file descriptor returned until
explicitly disconnected by a
.UL close
call, or until the program terminates.
.RE
.UL open
returns
.UL IOERROR
if the file cannot be accessed as desired, for any reason;
otherwise it returns a value of type
.UL filedesc
suitable for use with subsequent calls to
.UL close ,
.UL getcf ,
.UL getline ,
.UL putcf ,
.UL putstr ,
or
.UL seek .
