{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ endcmd (UCSD) -- close all files on exit }
procedure endcmd;
var
	fd : filedesc;
begin
	for fd := STDIN to MAXOPEN do
		xclose(fd)
end;
