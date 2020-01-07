{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getpbc -- get a (possibly pushed back) character }
function getpbc (var c : character) : character;
begin
	if (bp > 0) then 
		c := buf[bp]
	else begin
		bp := 1;
		buf[bp] := getc(c)
	end;
	if (c <> ENDFILE) then 
		bp := bp - 1;
	getpbc := c
end;
