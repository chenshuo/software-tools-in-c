{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ concat -- concatenate files onto standard output }
procedure concat;
var
	i : integer;
	junk : boolean;
	fd : filedesc;
	s : string;
begin
	for i := 1 to nargs do begin
		junk := getarg(i, s, MAXSTR);
		fd := mustopen(s, IOREAD);
		fcopy(fd, STDOUT);
		close(fd)
	end
end;
