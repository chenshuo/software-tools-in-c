{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ subst -- substitute "sub" for occurrences of pattern }
function subst (var sub : string; gflag, glob : boolean) : stcode;
var
	new, old : string;
	j, k, lastm, line, m : integer;
	stat : stcode;
	done, subbed, junk : boolean;
begin
	if (glob) then
		stat := OK
	else
		stat := ERR;
	done := (line1 <= 0);
	line := line1;
	while (not done) and (line <= line2) do begin
		j := 1;
		subbed := false;
		gettxt(line, old);
		lastm := 0;
		k := 1;
		while (old[k] <> ENDSTR) do begin
			if (gflag) or (not subbed) then 
				m := amatch(old, k, pat, 1)
			else
				m := 0;
			if (m > 0) and (lastm <> m) then begin
				{ replace matched text }
				subbed := true;
				catsub(old, k, m, sub, new, j, MAXSTR);
				lastm := m
			end;
			if (m = 0) or (m = k) then begin
				{ no match or null match }
				junk := addstr(old[k], new, j, MAXSTR);
				k := k + 1
			end
			else	{ skip matched text }
				k := m
		end;
		if (subbed) then begin
			if (not addstr(ENDSTR, new, j, MAXSTR)) then begin
				stat := ERR;
				done := true
			end
			else begin
				stat := lndelete(line, line, status);
				stat := puttxt(new);
				line2 := line2+curln-line;
				line := curln;
				if (stat = ERR) then 
					done := true
				else
					stat := OK
			end
		end;
		line := line + 1
	end;
	subst := stat
end;
