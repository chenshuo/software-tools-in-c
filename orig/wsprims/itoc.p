{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ itoc - convert integer n to char string in str[i]... }
function itoc (n : integer; var str : string; i : integer)
		: integer;	{ returns 1st free i }
begin
	if (n < 0) then begin
		str[i] := ord('-');
		itoc := itoc(-n, str, i+1)
	end
	else begin
		if (n >= 10) then
			i := itoc(n div 10, str, i);
		str[i] := n mod 10 + ord('0');
		str[i+1] := ENDSTR;
		itoc := i + 1
	end
end;
