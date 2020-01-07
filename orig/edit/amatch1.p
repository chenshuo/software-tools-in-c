{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ amatch -- with some metacharacters }
function amatch (var lin : string; i : integer; 
		var pat : string; j : integer) : integer;
#include "omatch.p"
begin
	while (pat[j] <> ENDSTR) and (i > 0) do
		if (omatch(lin, i, pat, j)) then
			j := j + patsize(pat, j)
		else
			i := 0;	{ no match possible }
	amatch := i
end;
