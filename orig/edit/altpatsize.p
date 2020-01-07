{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ patsize -- returns size of pattern entry at pat[n] }
function patsize (var pat : string; n : integer) : integer;
begin
	if (pat[n] = LITCHAR) then 
		patsize := 2
	else if (pat[n] in [BOL, EOL, ANY]) then
		patsize := 1
	else if (pat[n] = CCL) or (pat[n] = NCCL) then 
		patsize := pat[n+1] + 2
	else if (pat[n] = CLOSURE) then 
		patsize := CLOSIZE
	else
		error('in patsize: can''t happen')
end;
