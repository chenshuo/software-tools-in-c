{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ seek (WS) -- special version of primitive for edit }
procedure lseek (fd : filedesc; off, hioff, mode : integer);
	external;	{ PDP-11 long format only }

procedure seek (recno : integer; fd : filedesc);
begin
	lseek(scrout, 0, MAXSTR * recno, 0)
end;
