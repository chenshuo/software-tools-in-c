{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getline (UCB) -- get a line from file }
function getline (var s : string; fd : filedesc;
		maxsize : integer) : boolean;
var
	i : integer;
	c : character;
begin
	i := 1;
	repeat
		s[i] := getcf(c, fd);
		i := i + 1
	until (c = ENDFILE) or (c = NEWLINE) or (i >= maxsize);
	if (c = ENDFILE) then	{ went one too far }
		i := i - 1;
	s[i] := ENDSTR;
	getline := (c <> ENDFILE)
end;
