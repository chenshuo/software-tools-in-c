{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ initdef -- initialize variables for define }
procedure initdef;
begin
	{ setstring(defname, 'define'); }
		defname[1] := ord('d');
		defname[2] := ord('e');
		defname[3] := ord('f');
		defname[4] := ord('i');
		defname[5] := ord('n');
		defname[6] := ord('e');
		defname[7] := ENDSTR;
	bp := 0;	{ pushback buffer pointer }
	inithash
end;
