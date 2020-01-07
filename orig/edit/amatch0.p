{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ amatch -- with no metacharacters }
function amatch (var lin : string; i : integer;
		var pat : string; j : integer) : integer;
begin
	while (pat[j] <> ENDSTR) and (i > 0) do
		if (lin[i] <> pat[j]) then
			i := 0	{ no match }
		else begin
			i := i + 1;
			j := j + 1
		end;
	amatch := i
end;
