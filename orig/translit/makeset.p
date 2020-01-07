{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ makeset -- make set from inset[k] in outset }
function makeset (var inset : string; k : integer;
		var outset : string; maxset : integer) : boolean;
var
	j : integer;
#include "dodash.p"
begin
	j := 1;
	dodash(ENDSTR, inset, k, outset, j, maxset);
	makeset := addstr(ENDSTR, outset, j, maxset)
end;
