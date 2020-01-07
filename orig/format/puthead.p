{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ puthead -- put out page header }
procedure puthead;
begin
	curpage := newpage;
	newpage := newpage + 1;
	if (m1val > 0) then begin
		skip(m1val-1);
		puttl(header, curpage)
	end;
	skip(m2val);
	lineno := m1val + m2val + 1
end;
