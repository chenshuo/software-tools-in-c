{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ patsize -- returns size of pattern entry at pat[n] }
function patsize (var pat : string; n : integer) : integer;
begin
	if (not (pat[n] in
	  [LITCHAR, BOL, EOL, ANY, CCL, NCCL, CLOSURE])) then
		error('in patsize: can''t happen')
	else
		case pat[n] of
			LITCHAR:
				patsize := 2;
			BOL, EOL, ANY:
				patsize := 1;
			CCL, NCCL:
				patsize := pat[n+1] + 2;
			CLOSURE:
				patsize := CLOSIZE
		end
end;
