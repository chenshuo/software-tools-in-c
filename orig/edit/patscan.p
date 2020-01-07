{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ patscan -- find next occurrence of pattern after line n }
function patscan (way : character; var n : integer) : stcode;
var
	done : boolean;
	line : string;
begin
	n := curln;
	patscan := ERR;
	done := false;
	repeat
		if (way = SCAN) then 
			n := nextln(n)
		else
			n := prevln(n);
		gettxt(n, line);
		if (match(line, pat)) then begin
			patscan := OK;
			done := true
		end
	until (n = curln) or (done)
end;
