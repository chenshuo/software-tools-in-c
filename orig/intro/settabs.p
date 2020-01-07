{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ settabs -- set initial tab stops }
procedure settabs (var tabstops : tabtype);
const
	TABSPACE = 4;	{ 4 spaces per tab }
var
	i : integer;
begin
	for i := 1 to MAXLINE do
		tabstops[i] := (i mod TABSPACE = 1)
end;
