{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ catsub -- add replacement text to end of new }
procedure catsub (var lin : string; s1, s2 : integer; 
		var sub : string; var new : string;
		var k : integer; maxnew : integer);
var
	i, j : integer;
	junk : boolean;
begin
	i := 1;
	while (sub[i] <> ENDSTR) do begin
		if (sub[i] = DITTO) then 
			for j := s1 to s2-1 do
				junk := addstr(lin[j], new, k, maxnew)
		else
			junk := addstr(sub[i], new, k, maxnew);
		i := i + 1
	end
end;
