{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ move -- move line1 through line2 after line3 }
function move (line3 : integer) : stcode;
begin
	if (line1<=0) or ((line3>=line1) and (line3<line2)) then 
		move := ERR
	else begin
		blkmove(line1, line2, line3);
		if (line3 > line1) then
			curln := line3
		else
			curln := line3 + (line2 - line1 + 1);
		move := OK
	end
end;
