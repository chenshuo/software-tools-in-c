{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ puttl -- put out title line with optional page number }
procedure puttl (var buf : string; pageno : integer);
var
	i : integer;
begin
	for i := 1 to length(buf) do
		if (buf[i] = PAGENUM) then 
			putdec(pageno, 1)
		else
			putc(buf[i])
end;
