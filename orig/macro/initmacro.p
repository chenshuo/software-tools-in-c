{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ initmacro -- initialize variables for macro }
procedure initmacro;
begin
	null[1] := ENDSTR;
	{ setstring(defname, 'define'); }
		defname[1] := ord('d');
		defname[2] := ord('e');
		defname[3] := ord('f');
		defname[4] := ord('i');
		defname[5] := ord('n');
		defname[6] := ord('e');
		defname[7] := ENDSTR;
	{ setstring(subname, 'substr'); }
		subname[1] := ord('s');
		subname[2] := ord('u');
		subname[3] := ord('b');
		subname[4] := ord('s');
		subname[5] := ord('t');
		subname[6] := ord('r');
		subname[7] := ENDSTR;
	{ setstring(exprname, 'expr'); }
		exprname[1] := ord('e');
		exprname[2] := ord('x');
		exprname[3] := ord('p');
		exprname[4] := ord('r');
		exprname[5] := ENDSTR;
	{ setstring(ifname, 'ifelse'); }
		ifname[1] := ord('i');
		ifname[2] := ord('f');
		ifname[3] := ord('e');
		ifname[4] := ord('l');
		ifname[5] := ord('s');
		ifname[6] := ord('e');
		ifname[7] := ENDSTR;
	{ setstring(lenname, 'len'); }
		lenname[1] := ord('l');
		lenname[2] := ord('e');
		lenname[3] := ord('n');
		lenname[4] := ENDSTR;
	{ setstring(chqname, 'changeq'); }
		chqname[1] := ord('c');
		chqname[2] := ord('h');
		chqname[3] := ord('a');
		chqname[4] := ord('n');
		chqname[5] := ord('g');
		chqname[6] := ord('e');
		chqname[7] := ord('q');
		chqname[8] := ENDSTR;
	bp := 0;	{ pushback buffer pointer }
	inithash;
	lquote := ord(GRAVE);
	rquote := ord(ACUTE)
end;
