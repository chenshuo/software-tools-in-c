{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getval -- evaluate optional numeric argument }
function getval (var buf : string;
		var argtype : integer) : integer;
var
	i : integer;
begin
	i := 1;	{ skip over command name }
	while (not (buf[i] in [BLANK, TAB, NEWLINE])) do
		i := i + 1;
	skipbl(buf, i);	{ find argument }
	argtype := buf[i];
	if (argtype = PLUS) or (argtype = MINUS) then 
		i := i + 1;
	getval := ctoi(buf, i)
end;
