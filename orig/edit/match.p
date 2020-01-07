{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ match -- find match anywhere on line }
function match (var lin, pat : string) : boolean;
var
	i, pos : integer;
#include "amatch.p"
begin
	pos := 0;
	i := 1;
	while (lin[i] <> ENDSTR) and (pos = 0) do begin
		pos := amatch(lin, i, pat, 1);
		i := i + 1
	end;
	match := (pos > 0)
end;
