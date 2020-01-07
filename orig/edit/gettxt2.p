{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gettxt (scratch file) -- get text from line n into s }
procedure gettxt (n : integer; var s : string);
var
	junk : boolean;
begin
	if (n = 0) then
		s[1] := ENDSTR
	else begin
		seek(buf[n].txt, scrin);
		recin := recin + 1;
		junk := getline(s, scrin, MAXSTR)
	end
end;
