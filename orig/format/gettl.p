{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gettl -- copy title from buf to ttl }
procedure gettl (var buf, ttl : string);
var
	i : integer;
begin
	i := 1;	{ skip command name }
	while (not (buf[i] in [BLANK, TAB, NEWLINE])) do
		i := i + 1;
	skipbl(buf, i);	{ find argument }
	if (buf[i] = SQUOTE) or (buf[i] = DQUOTE) then 
		i := i + 1;		{ strip leading quote }
	scopy(buf, i, ttl, 1)
end;
