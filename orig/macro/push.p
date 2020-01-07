{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ push -- push ep onto argstk, return new position ap }
function push (ep : integer; var argstk : posbuf;
		ap : integer) : integer;
begin
	if (ap > ARGSIZE) then 
		error('macro: argument stack overflow');
	argstk[ap] := ep;
	push := ap + 1
end;
