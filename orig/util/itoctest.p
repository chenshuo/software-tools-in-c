{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
procedure itoctest;
var
	i, n, d : integer;
	s : string;
begin
	while (getline(s, STDIN, MAXSTR)) do begin
		i := 1;
		n := ctoi(s, i);
		d := itoc(n, s, 1);
		putstr(s, STDOUT);
		putdec(n, 10);
		putdec(d, 10);
		putc(NEWLINE);
	end
end;
