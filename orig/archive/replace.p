{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ replace -- replace or delete files }
procedure replace (afd, tfd : filedesc; cmd : integer);
var
	inline, uname : string;
	size : integer;
begin
	while (gethdr(afd, inline, uname, size)) do 
		if (filearg(uname)) then begin
			if (cmd = ord('u')) then 	{ add new one }
				addfile(uname, tfd);
			fskip(afd, size)	{ discard old one }
		end
		else begin
			putstr(inline, tfd);
			acopy(afd, tfd, size)
		end
end;
