{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ makesub -- make substitution string from arg in sub }
function makesub (var arg : string; from : integer; 
		delim : character; var sub : string) : integer;
var
	i, j : integer;
	junk : boolean;
begin
	j := 1;
	i := from;
	while (arg[i] <> delim) and (arg[i] <> ENDSTR) do begin
		if (arg[i] = ord('&')) then 
			junk := addstr(DITTO, sub, j, MAXPAT)
		else
			junk := addstr(esc(arg, i), sub, j, MAXPAT);
		i := i + 1
	end;
	if (arg[i] <> delim) then 	{ missing delimiter }
		makesub := 0
	else if (not addstr(ENDSTR, sub, j, MAXPAT)) then 
		makesub := 0
	else
		makesub := i
end;
