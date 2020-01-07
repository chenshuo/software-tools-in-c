{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ popen (WS) -- Pascal open primitive }
function open (var name : string; mode, rsize : integer)
		: filedesc;
	external;

function popen (var name : string; mode : integer)
		: filedesc;
var
	fd : filedesc;
begin
	fd := open(name, mode, 0);
	if (fd < 0) then
		fd := IOERROR;
	popen := fd
end;
