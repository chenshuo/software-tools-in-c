{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getpat -- convert argument into pattern }
function getpat (var arg, pat : string) : boolean;
#include "makepat.p"
begin
	getpat := (makepat(arg, 1, ENDSTR, pat) > 0)
end;
