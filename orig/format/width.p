{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ width -- compute width of character string }
function width (var buf : string) : integer;
var
	i, w : integer;
begin
	w := 0;
	i := 1;
	while (buf[i] <> ENDSTR) do begin
		if (buf[i] = BACKSPACE) then 
			w := w - 1
		else if (buf[i] <> NEWLINE) then 
			w := w + 1;
		i := i + 1
	end;
	width := w
end;
