{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ dolen -- return length of argument }
procedure dolen(var argstk : posbuf; i, j : integer);
var
	temp : string;
begin
	if (j - i > 1) then begin
		cscopy(evalstk, argstk[i+2], temp);
		pbnum(length(temp))
	end
	else
		pbnum(0)
end;
