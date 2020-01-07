{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ setbuf (in memory) -- initialize line storage buffer }
procedure setbuf;
var
	null : string;	{ value is '' }
begin
	null[1] := ENDSTR;
	scopy(null, 1, buf[0].txt, 1);
	curln := 0;
	lastln := 0
end;
