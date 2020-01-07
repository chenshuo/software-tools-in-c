{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ itoc - convert integer n to char string in s[i]... }
function itoc (n : integer; var s : string; i : integer)
		: integer;	{ returns end of s }
begin
	if (n < 0) then begin
		s[i] := ord('-');
		itoc := itoc(-n, s, i+1)
	end
	else begin
		if (n >= 10) then
			i := itoc(n div 10, s, i);
		s[i] := n mod 10 + ord('0');
		s[i+1] := ENDSTR;
		itoc := i + 1
	end
end;
