{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ xindex -- conditionally invert value from index }
function xindex (var inset : string; c : character;
		allbut : boolean; lastto : integer) : integer;
begin
	if (c = ENDFILE) then 
		xindex := 0
	else if (not allbut) then 
		xindex := index(inset, c)
	else if (index(inset, c) > 0) then 
		xindex := 0
	else
		xindex := lastto + 1
end;
