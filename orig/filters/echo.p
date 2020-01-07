{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ echo -- echo command line arguments to output }
procedure echo;
var
	i, j : integer;
	argstr : string;
begin
	i := 1;
	while (getarg(i, argstr, MAXSTR)) do begin
		if (i > 1) then
			putc(BLANK);
		for j := 1 to length(argstr) do
			putc(argstr[j]);
		i := i + 1
	end;
	if (i > 1) then
		putc(NEWLINE)
end;
