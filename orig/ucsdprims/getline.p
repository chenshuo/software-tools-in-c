{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getline (UCSD) -- get a line from file }
function getline (var str : xstring; fd : filedesc;
		size : integer) : boolean;
var
	i : integer;
	done : boolean;
	ch : character;
begin
	i := 0;
	repeat
		done := true;
		ch := getcf(ch, fd);
		if (ch = ENDFILE) then
			i := 0
		else if (ch = NEWLINE) then begin
			i := i + 1;
			str[i] := NEWLINE
		end
		else if (size-2 <= i) then begin
			message('line too long');
			i := i + 1;
			str[i] := NEWLINE
		end
		else begin
			done := false;
			i := i + 1;
			str[i] := ch
		end
	until (done);
	str[i + 1] := ENDSTR;
	getline := (0 < i)
end;
