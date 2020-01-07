{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ pcreate (WS) -- Pascal create primitive }
function create (var name : string; mode, rsize : integer)
		: filedesc;
	external;

function pcreate (var name : string; mode : integer)
		: filedesc;
var
	fd : filedesc;
begin
	fd := create(name, mode, 0);
	if (fd < 0) then
		fd := IOERROR;
	pcreate := fd
end;
