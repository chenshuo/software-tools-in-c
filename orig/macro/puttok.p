{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ puttok -- put token on output or evaluation stack }
procedure puttok (var s : string);
var
	i : integer;
begin
	i := 1;
	while (s[i] <> ENDSTR) do begin
		putchr(s[i]);
		i := i + 1
	end
end;
