{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ doif -- select one of two arguments }
procedure doif (var argstk : posbuf; i, j : integer);
var
	temp1, temp2, temp3 : string;
begin
	if (j - i >= 4) then begin
		cscopy(evalstk, argstk[i+2], temp1);
		cscopy(evalstk, argstk[i+3], temp2);
		if (equal(temp1, temp2)) then 
			cscopy(evalstk, argstk[i+4], temp3)
		else if (j - i >= 5) then
			cscopy(evalstk, argstk[i+5], temp3)
		else
			temp3[1] := ENDSTR;
		pbstr(temp3)
	end
end;
