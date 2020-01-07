{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ mustopen -- open file or die }
function mustopen (var name : string; mode : integer)
		: filedesc;
var
	fd : filedesc;
begin
	fd := open(name, mode);
	if (fd = IOERROR) then begin
		putstr(name, STDERR);
		error(': can''t open file')
	end;
	mustopen := fd
end;
