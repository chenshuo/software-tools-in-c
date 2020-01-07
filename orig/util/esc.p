{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ esc -- map s[i] into escaped character, increment i }
function esc (var s : string; var i : integer) : character;
begin
	if (s[i] <> ESCAPE) then 
		esc := s[i]
	else if (s[i+1] = ENDSTR) then 	{ @ not special at end }
		esc := ESCAPE
	else begin
		i := i + 1;
		if (s[i] = ord('n')) then 
			esc := NEWLINE
		else if (s[i] = ord('t')) then 
			esc := TAB
		else
			esc := s[i]
	end
end;
