{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fgetcf -- get character from file }
function fgetcf (var fil : text) : character;
var
	ch : char;
begin
	if (eof(fil)) then
		fgetcf := ENDFILE
	else if (eoln(fil)) then begin
		readln(fil);
		fgetcf := NEWLINE
	end
	else begin
		read(fil, ch);
		fgetcf := ord(ch)
	end;
end;
