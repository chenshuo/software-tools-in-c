{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ pbnum -- convert number to string, push back on input }
procedure pbnum (n : integer);
var
	temp : string;
	junk : integer;
begin
	junk := itoc(n, temp, 1);
	pbstr(temp)
end;
