{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getc and getcf (WS) -- get one character of input }
function read (fd : filedesc; var c : character;
		size : integer) : boolean;
	external;

function getc (var c : character) : character;
begin
	if (not read(STDIN, c, 1)) then
		c := ENDFILE;
	getc := c
end;

function getcf(var c : character; fd : filedesc) : character;
begin
	if (not read(fd, c, 1)) then
		c := ENDFILE;
	getcf := c
end;
