{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ puttxt (scratch file) -- put text from lin after curln }
function puttxt (var lin : string) : stcode;
begin
	puttxt := ERR;
	if (lastln < MAXLINES) then begin
		lastln := lastln + 1;
		putstr(lin, scrout);
		putmark(lastln, false);
		buf[lastln].txt := recout;
		recout := recout + 1;
		blkmove(lastln, lastln, curln);
		curln := curln + 1;
		puttxt := OK
	end
end;
