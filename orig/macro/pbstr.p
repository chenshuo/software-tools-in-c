{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ pbstr -- push string back onto input }
procedure pbstr (var s : string);
var
	i : integer;
begin
	for i := length(s) downto 1 do
		putback(s[i])
end;
