{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ max -- compute maximum of two integers }
function max (x, y : integer) : integer;
begin
	if (x > y) then
		max := x
	else
		max := y
end;
