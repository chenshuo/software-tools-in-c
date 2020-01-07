{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ puttxt (in memory) -- put text from lin after curln }
function puttxt (var lin : string) : stcode;
begin
	puttxt := ERR;
	if (lastln < MAXLINES) then begin
		lastln := lastln + 1;
		scopy(lin, 1, buf[lastln].txt, 1);
		putmark(lastln, false);
		blkmove(lastln, lastln, curln);
		curln := curln + 1;
		puttxt := OK
	end
end;
