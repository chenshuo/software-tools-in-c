{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fputcf -- put a character to file }
procedure fputcf (c : character; var fil : text);
begin
	if (c = NEWLINE) then
		writeln(fil)
	else
		write(fil, chr(c))
end;
