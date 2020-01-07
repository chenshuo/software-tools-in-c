{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ addfile -- add file "name" to archive }
procedure addfile (var name : string; fd : filedesc);
var
	head : string;
	nfd : filedesc;
#include "makehdr.p"
begin
	nfd := open(name, IOREAD);
	if (nfd = IOERROR) then begin
		putstr(name, STDERR);
		message(': can''t add');
		errcount := errcount + 1
	end;
	if (errcount = 0) then begin
		makehdr(name, head);
		putstr(head, fd);
		fcopy(nfd, fd);
		close(nfd)
	end
end;
