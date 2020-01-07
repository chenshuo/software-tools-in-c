{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ lndelete -- delete lines n1 through n2 }
function lndelete (n1, n2 : integer; var status : stcode)
		: stcode;
begin
	if (n1 <= 0) then 
		status := ERR
	else begin
		blkmove(n1, n2, lastln);
		lastln := lastln - (n2 - n1 + 1);
		curln := prevln(n1);
		status := OK
	end;
	lndelete := status
end;
