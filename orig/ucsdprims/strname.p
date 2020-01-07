{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ strname -- map to native string filename }
procedure strname (var str : string; var xstr : xstring);
var
	i : integer;
begin
	str := '.text';
	i := 1;
	while (xstr[i] <> ENDSTR) do begin
		insert('x', str, i);
		str[i] := chr(xstr[i]);
		i := i + 1
	end
end;
