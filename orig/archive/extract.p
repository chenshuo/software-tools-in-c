{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ extract -- extract files from archive }
procedure extract (var aname: string; cmd : character);
var
	ename, inline : string;
	afd, efd : filedesc;
	size : integer;
begin
	afd := mustopen(aname, IOREAD);
	if (cmd = ord('p')) then 
		efd := STDOUT
	else		{ cmd is 'x' }
		efd := IOERROR;
	while (gethdr(afd, inline, ename, size)) do 
		if (not filearg(ename)) then 
			fskip(afd, size)
		else begin
			if (efd <> STDOUT) then 
				efd := create(ename, IOWRITE);
			if (efd = IOERROR) then begin
				putstr(ename, STDERR);
				message(': can''t create');
				errcount := errcount + 1;
				fskip(afd, size)
			end
			else begin
				acopy(afd, efd, size);
				if (efd <> STDOUT) then 
					close(efd)
			end
		end;
	notfound
end;
