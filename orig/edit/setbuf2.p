{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ setbuf (scratch file) -- create scratch file, set up line 0 }
procedure setbuf;
begin
	{ setstring(edittemp, 'edtemp'); }
		edittemp[1] := ord('e');
		edittemp[2] := ord('d');
		edittemp[3] := ord('t');
		edittemp[4] := ord('e');
		edittemp[5] := ord('m');
		edittemp[6] := ord('p');
		edittemp[7] := ENDSTR;
	scrout := mustcreate(edittemp, IOWRITE);
	scrin := mustopen(edittemp, IOREAD);
	recout := 1;
	recin := 1;
	curln := 0;
	lastln := 0
end;
