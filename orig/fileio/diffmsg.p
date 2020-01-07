{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ diffmsg -- print line numbers and differing lines }
procedure diffmsg (n : integer; var line1, line2 : string);
begin
	putdec(n, 1);
	putc(COLON);
	putc(NEWLINE);
	putstr(line1, STDOUT);
	putstr(line2, STDOUT)
end;
