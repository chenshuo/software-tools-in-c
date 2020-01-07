{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ space -- space n lines or to bottom of page }
procedure space (n : integer);
begin
	break;
	if (lineno <= bottom) then begin
		if (lineno <= 0) then 
			puthead;
		skip(min(n, bottom+1-lineno));
		lineno := lineno + n;
		if (lineno > bottom) then 
			putfoot
	end
end;
