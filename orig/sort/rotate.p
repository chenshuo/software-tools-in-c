{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ rotate -- output rotated line }
procedure rotate (var buf : string; n : integer);
var
	i : integer;
begin
	i := n;
	while (buf[i] <> NEWLINE) and (buf[i] <> ENDSTR) do begin
		putc(buf[i]);
		i := i + 1
	end;
	putc(FOLD);
	for i := 1 to n-1 do
		putc(buf[i]);
	putc(NEWLINE)
end;
