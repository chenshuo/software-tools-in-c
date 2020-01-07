{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putfoot -- put out page footer }
procedure putfoot;
begin
	skip(m3val);
	if (m4val > 0) then begin
		puttl(footer, curpage);
		skip(m4val-1)
	end
end;
