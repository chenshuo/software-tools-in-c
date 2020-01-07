{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ nargs (UCB) -- return number of arguments }
{	non-portable.  uses Berkeley conventions }
function nargs : integer;
begin
	nargs := argc - 1
end;
