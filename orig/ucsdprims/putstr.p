{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putstr (UCSD) -- put out string on file }
procedure putstr (str : xstring; fd : filedesc);
var
	i : integer;
begin
	i := 1;
	while (str[i] <> ENDSTR) do begin
		putcf(str[i], fd);
		i := i + 1
	end
end;
