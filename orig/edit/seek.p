{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ seek (UCB) -- special version of primitive for edit }
procedure seek (recno : integer; var fd : filedesc);
var
	junk : boolean;
	temp : string;
begin
	flush(openlist[scrout].filevar);  { necessary for UCB }
	if (recno < recin) then begin
		close(fd);
		{ cheat: open scratch file by name }
		fd := mustopen(edittemp, IOREAD);
		recin := 1;
	end;
	while (recin < recno) do begin
		junk := getline(temp, fd, MAXSTR);
		recin := recin + 1
	end
end;
