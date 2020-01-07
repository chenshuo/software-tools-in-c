{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getline (WS) -- get a line from file }
function read (fd : filedesc; var c : character;
		size : integer) : boolean;
	external;

function getline (var s : string; fd : filedesc;
		maxsize : integer) : boolean;
var
	i : integer;
	c : character;
	done : boolean;
begin
	i := 1;
	done := false;
	repeat
		if (read(fd, c, 1)) then
			s[i] := c
		else
			done := true;
		i := i + 1
	until (done) or (c = NEWLINE) or (i >= maxsize);
	if (done) then	{ went one too far }
		i := i - 1;
	s[i] := ENDSTR;
	getline := (not done)
end;
