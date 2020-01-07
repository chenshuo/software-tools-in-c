{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ table -- print table of archive contents }
procedure table (var aname : string);
var
	head, name : string;
	size : integer;
	afd : filedesc;
#include "tprint.p"
begin
	afd := mustopen(aname, IOREAD);
	while (gethdr(afd, head, name, size)) do begin
		if (filearg(name)) then 
			tprint(head);
		fskip(afd, size)
	end;
	notfound
end;
