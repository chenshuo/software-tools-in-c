{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ pputstr (WS) -- Pascal putstr primitive }
procedure write (fd : filedesc; var c : string;
		size : integer);
	external;

procedure pputstr (var str : string; fd : filedesc);
var
	i : integer;
begin
	i := 1;
	while (str[i] <> ENDSTR) do
		i := i + 1;
	if (i > 1) then
		write(fd, str, i-1)
end;
