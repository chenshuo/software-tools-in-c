{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ equal -- test two strings for equality }
function equal (var str1, str2 : string) : boolean;
var
	i : integer;
begin
	i := 1;
	while (str1[i] = str2[i]) and (str1[i] <> ENDSTR) do
		i := i + 1;
	equal := (str1[i] = str2[i])
end;
