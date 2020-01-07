{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ put -- put out line with proper spacing and indenting }
procedure put (var buf : string);
var
	i : integer;
begin
	if (lineno <= 0) or (lineno > bottom) then 
		puthead;
	for i := 1 to inval + tival do		{ indenting }
		putc(BLANK);
	tival := 0;
	putstr(buf, STDOUT);
	skip(min(lsval-1, bottom-lineno));
	lineno := lineno + lsval;
	if (lineno > bottom) then 
		putfoot
end;
