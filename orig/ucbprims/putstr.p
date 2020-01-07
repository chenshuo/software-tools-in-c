{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putstr (UCB) -- put out string on file }
procedure putstr (var s : string; f : filedesc);
var
	i : integer;
begin
	i := 1;
	while (s[i] <> ENDSTR) do begin
		putcf(s[i], f);
		i := i + 1
	end
end;
