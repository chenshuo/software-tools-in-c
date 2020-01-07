{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putrep -- put out representation of run of n 'c's }
procedure putrep (n : integer; c : character);
const
	MAXREP = 26;	{ assuming 'A'..'Z' }
	THRESH = 4;
begin
	while (n >= THRESH) or ((c = WARNING) and (n > 0)) do begin
		putc(WARNING);
		putc(min(n, MAXREP) - 1 + ord('A'));
		putc(c);
		n := n - MAXREP
	end;
	for n := n downto 1 do
		putc(c)
end;
