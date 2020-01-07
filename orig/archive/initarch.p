{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ initarch -- initialize variables for archive }
procedure initarch;
begin
	{ setstring(archtemp, 'artemp'); }
		archtemp[1] := ord('a');
		archtemp[2] := ord('r');
		archtemp[3] := ord('t');
		archtemp[4] := ord('e');
		archtemp[5] := ord('m');
		archtemp[6] := ord('p');
		archtemp[7] := ENDSTR;
	{ setstring(archhdr, '-h-'); }
		archhdr[1] := ord('-');
		archhdr[2] := ord('h');
		archhdr[3] := ord('-');
		archhdr[4] := ENDSTR;
end;
