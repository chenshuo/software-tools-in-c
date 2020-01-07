{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gname -- generate unique name for file id n }
procedure gname (n : integer; var name : string);
var
	junk : integer;
begin
	{ setstring(name, 'stemp'); }
		name[1] := ord('s');
		name[2] := ord('t');
		name[3] := ord('e');
		name[4] := ord('m');
		name[5] := ord('p');
		name[6] := ENDSTR;
	junk := itoc(n, name, length(name)+1)
end;
