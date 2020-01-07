{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ doprint -- print lines n1 through n2 }
function doprint (n1, n2 : integer) : stcode;
var
	i : integer;
	line : string;
begin
	if (n1 <= 0) then 
		doprint := ERR
	else begin
		for i := n1 to n2 do begin
			gettxt(i, line);
			putstr(line, STDOUT)
		end;
		curln := n2;
		doprint := OK
	end
end;
