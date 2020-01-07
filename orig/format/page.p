{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ page -- get to top of new page }
procedure page;
begin
	break;
	if (lineno > 0) and (lineno <= bottom) then begin
		skip(bottom+1-lineno);
		putfoot
	end;
	lineno := 0
end;
