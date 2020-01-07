{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getword -- get word from s[i] into out }
function getword (var s : string; i : integer;
		 var out : string) : integer;
var
	j : integer;
begin
	while (s[i] in [BLANK, TAB, NEWLINE]) do
		i := i + 1;
	j := 1;
	while (not (s[i] in [ENDSTR,BLANK,TAB,NEWLINE])) do begin
		out[j] := s[i];
		i := i + 1;
		j := j + 1
	end;
	out[j] := ENDSTR;
	if (s[i] = ENDSTR) then
		getword := 0
	else
		getword := i
end;
