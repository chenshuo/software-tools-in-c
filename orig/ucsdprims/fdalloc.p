{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fdalloc -- allocate a file descriptor }
function fdalloc : filedesc;
var
	done : boolean;
	fd : filedesc;
begin
	fd := STDIN;
	done := false;
	while (not done) do
		if ((cmdfil[fd] = CLOSED) or (fd = MAXOPEN)) then
			done := true
		else
			fd := succ(fd);
	if (cmdfil[fd] <> CLOSED) then
		fdalloc := IOERROR
	else begin
		cmdfil[fd] := ftalloc;
		if (cmdfil[fd] = CLOSED) then
			fdalloc := IOERROR
		else begin
			cmdopen[cmdfil[fd]] := true;
			fdalloc := fd
		end
	end
end;
