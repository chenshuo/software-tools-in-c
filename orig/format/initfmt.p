{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ initfmt -- set format parameters to default values }
procedure initfmt;
begin
	fill := true;
	dir := 0;
	inval := 0;
	rmval := PAGEWIDTH;
	tival := 0;
	lsval := 1;
	spval := 0;
	ceval := 0;
	ulval := 0;
	lineno := 0;
	curpage := 0;
	newpage := 1;
	plval := PAGELEN;
	m1val := 3; m2val := 2; m3val := 2; m4val := 3;
	bottom := plval - m3val - m4val;
	header[1] := NEWLINE;	{ initial titles }
	header[2] := ENDSTR;
	footer[1] := NEWLINE;
	footer[2] := ENDSTR;
	outp := 0;
	outw := 0;
	outwds := 0
end;
