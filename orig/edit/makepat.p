{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ makepat -- make pattern from arg[i], terminate at delim }
function makepat (var arg : string; start : integer; 
		delim : character; var pat : string) : integer;
var
	i, j, lastj, lj : integer;
	done, junk : boolean;
#include "getccl.p"
#include "stclose.p"
begin
	j := 1;	{ pat index }
	i := start;	{ arg index }
	lastj := 1;
	done := false;
	while (not done) and (arg[i] <> delim)
	  and (arg[i] <> ENDSTR) do begin
		lj := j;
		if (arg[i] = ANY) then 
			junk := addstr(ANY, pat, j, MAXPAT)
		else if (arg[i] = BOL) and (i = start) then 
			junk := addstr(BOL, pat, j, MAXPAT)
		else if (arg[i] = EOL) and (arg[i+1] = delim) then 
			junk := addstr(EOL, pat, j, MAXPAT)
		else if (arg[i] = CCL) then
			done := (getccl(arg, i, pat, j) = false) 
		else if (arg[i] = CLOSURE) and (i > start) then begin
			lj := lastj;
			if (pat[lj] in [BOL, EOL, CLOSURE]) then
				done := true	{ force loop termination }
			else
				stclose(pat, j, lastj)
		end
		else begin
			junk := addstr(LITCHAR, pat, j, MAXPAT);
			junk := addstr(esc(arg, i), pat, j, MAXPAT)
		end;
		lastj := lj;
		if (not done) then
			i := i + 1
	end;
	if (done) or (arg[i] <> delim) then  { finished early }
		makepat := 0
	else if (not addstr(ENDSTR, pat, j, MAXPAT)) then 
		makepat := 0		{ no room }
	else
		makepat := i		{ all is well }
end;
