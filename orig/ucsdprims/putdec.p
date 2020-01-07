{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putdec -- put decimal integer n in field width >= w }
procedure putdec (n, w : integer);
var
	i, nd : integer;
	s : xstring;
begin
	nd := itoc(n, s, 1);
	for i := nd to w do
		putc(BLANK);
	for i := 1 to nd-1 do
		putc(s[i])
end;
