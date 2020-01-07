{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ prevln -- get line before n }
function prevln (n : integer) : integer;
begin
	if (n <= 0) then
		prevln := lastln
	else
		prevln := n - 1
end;
