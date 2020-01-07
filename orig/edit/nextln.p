{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ nextln -- get line after n }
function nextln (n : integer) : integer;
begin
	if (n >= lastln) then 
		nextln := 0
	else
		nextln := n + 1
end;
