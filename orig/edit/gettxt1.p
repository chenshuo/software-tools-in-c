{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gettxt (in memory) -- get text from line n into s }
procedure gettxt (n : integer; var s : string);
begin
	scopy(buf[n].txt, 1, s, 1)
end;
