{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM archive maintain file archive
.SY
.UL "archive -cmd aname [ file ... ]"
.FU
.UL archive
manages any number of member files in a single file,
.UL aname ,
with sufficient information that members may be selectively added, extracted,
replaced, or deleted from the collection.
.UL -cmd
is a code that determines the operation to be performed:
.P1
-c\f1	create a new archive with named members\fP
-d\f1	delete named members from archive\fP
-p\f1	print named members on standard output\fP
-t\f1	print table of archive contents\fP
-u\f1	update named members or add at end\fP
-x\f1	extract named members from archive\fP
.P2
In each case, the ``named members'' are the zero or more filenames
given as arguments following
.UL aname .
If no arguments follow, then the ``named members'' are taken as
.ul
all
of the files in the archive, except for the delete command
.UL -d ,
which is not so rash.
.UL archive
complains if a file is named twice or cannot be accessed.
.IP
The
.UL -t
command writes one line to the output for each named member,
consisting of
the member name
and a string representation of the file length, separated
by a blank.
.IP
The
create command
.UL -c
makes a new archive containing the named files.
The
update command
.UL -u
replaces existing named members and adds new files onto
the end of an existing archive.
Create and update read from, and extract writes to, files whose names are the same
as the member names in the archive.
An intermediate version of the new archive file is first written to the file
.UL artemp ;
hence this filename should be avoided.
.IP
An archive is a concatenation of zero or more entries,
each consisting of a header and an exact copy of the original file.
The header format is
.Q1
.Q2
.EG
To replace two files in an existing archive, add a new one, then print the table of contents:
.Q1
archive -u archfile old1 old2 new1
archive -t archfile
.Q2
