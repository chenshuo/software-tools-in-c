{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putsub -- output substitution text }
procedure putsub (var lin : string; s1, s2 : integer; 
		var sub : string);
var
	i, j : integer;
	junk : boolean;
begin
	i := 1;
	while (sub[i] <> ENDSTR) do begin
		if (sub[i] = DITTO) then 
			for j := s1 to s2-1 do
				putc(lin[j])
		else
			putc(sub[i]);
		i := i + 1
	end
end;
