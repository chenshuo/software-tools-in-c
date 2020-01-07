{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ doexpr -- evaluate arithmetic expressions }
procedure doexpr (var argstk : posbuf; i, j : integer);
var
	temp : string;
	junk : integer;
begin
	cscopy(evalstk, argstk[i+2], temp);
	junk := 1;
	pbnum(expr(temp, junk))
end;
