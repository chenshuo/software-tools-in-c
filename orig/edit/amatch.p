{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ amatch -- look for match of pat[j]... at lin[offset]... }
function amatch (var lin : string; offset : integer; 
		var pat : string; j : integer) : integer;
var
	i, k : integer;
	done : boolean;
#include "omatch.p"
#include "patsize.p"
begin
	done := false;
	while (not done) and (pat[j] <> ENDSTR) do
		if (pat[j] = CLOSURE) then begin
			j := j + patsize(pat, j);	{ step over CLOSURE }
			i := offset;
			{ match as many as possible }
			while (not done) and (lin[i] <> ENDSTR) do
				if (not omatch(lin, i, pat, j)) then 
					done := true;
			{ i points to input character that made us fail }
			{ match rest of pattern against rest of input }
			{ shrink closure by 1 after each failure }
			done := false;
			while (not done) and (i >= offset) do begin
				k := amatch(lin, i, pat, j+patsize(pat,j));
				if (k > 0) then	{ matched rest of pattern }
					done := true
				else
					i := i - 1
			end;
			offset := k;	{ if k = 0 failure else success }
			done := true
		end
		else if (not omatch(lin, offset, pat, j)) then begin
			offset := 0;		{ non-closure }
			done := true
		end
		else	{ omatch succeeded on this pattern element }
			j := j + patsize(pat, j);
	amatch := offset
end;
