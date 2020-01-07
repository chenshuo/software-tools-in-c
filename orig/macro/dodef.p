{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ dodef -- install definition in table }
procedure dodef (var argstk : posbuf; i, j : integer);
var
	temp1, temp2 : string;
begin
	if (j - i > 2) then begin
		cscopy(evalstk, argstk[i+2], temp1);
		cscopy(evalstk, argstk[i+3], temp2);
		install(temp1, temp2, MACTYPE)
	end
end;
