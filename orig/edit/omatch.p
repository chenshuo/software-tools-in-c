{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ omatch -- match one pattern element at pat[j] }
function omatch (var lin : string; var i : integer; 
		var pat : string; j : integer) : boolean;
var
	advance : -1..1;
#include "locate.p"
begin
	advance := -1;
	if (lin[i] = ENDSTR) then 
		omatch := false
	else if (not (pat[j] in
	  [LITCHAR, BOL, EOL, ANY, CCL, NCCL, CLOSURE])) then
		error('in omatch: can''t happen')
	else
		case pat[j] of
			LITCHAR:
				if (lin[i] = pat[j+1]) then 
					advance := 1;
			BOL:
				if (i = 1) then 
					advance := 0;
			ANY:
				if (lin[i] <> NEWLINE) then 
					advance := 1;
			EOL:
				if (lin[i] = NEWLINE) then 
					advance := 0;
			CCL:
				if (locate(lin[i], pat, j+1)) then 
					advance := 1;
			NCCL:
				if (lin[i] <> NEWLINE) 
				   and (not locate(lin[i], pat, j+1)) then 
					advance := 1
		end;
	if (advance >= 0) then begin
		i := i + advance;
		omatch := true
	end
	else
		omatch := false
end;
