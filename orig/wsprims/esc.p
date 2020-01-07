{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ esc -- map inset[i] into escaped character if appropriate }
function esc (var inset : string; var i : integer) : character;

begin
	if (inset[i] <> ESCAPE) then 
		esc := inset[i]
	else if (inset[i+1] = ENDSTR) then 	{ @ not special at end }
		esc := ESCAPE
	else begin
		i := i + 1;
		if (inset[i] = ord('n')) then 
			esc := NEWLINE
		else if (inset[i] = ord('t')) then 
			esc := TAB
		else
			esc := inset[i]
	end
end;
