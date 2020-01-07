{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ doglob -- do command at lin[i] on all marked lines }
function doglob (var lin : string; var i, cursave : integer;
		var status : stcode) : stcode;
var
	count, istart, n : integer;
begin
	status := OK;
	count := 0;
	n := line1;
	istart := i;
	repeat
		if (getmark(n)) then begin
			putmark(n, false);
			curln := n;
			cursave := curln;
			i := istart;
			if (getlist(lin, i, status) = OK) then 
			  if (docmd(lin, i, true, status) = OK) then
				count := 0
		end
		else begin
			n := nextln(n);
			count := count + 1
		end
	until (count > lastln) or (status <> OK);
	doglob := status
end;
