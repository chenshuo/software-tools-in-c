{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getsub -- get substitution string into sub }
function getsub (var arg, sub : string) : boolean;
#include "makesub.p"
begin
	getsub := (makesub(arg, 1, ENDSTR, sub) > 0)
end;
