{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ close (UCB) -- release file descriptor slot for open file }
procedure close (fd : filedesc);
begin
	if (fd > STDERR) and (fd <= MAXOPEN) then begin
		flush(openlist[fd].filevar);	{ in case buffered }
		openlist[fd].mode := IOAVAIL
	end
end;
