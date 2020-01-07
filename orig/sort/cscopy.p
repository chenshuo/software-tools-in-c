{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ cscopy -- copy cb[i]... to string s }
procedure cscopy (var cb : charbuf; i : charpos;
		var s : string);
var
	j : integer;
begin
	j := 1;
	while (cb[i] <> ENDSTR) do begin
		s[j] := cb[i];
		i := i + 1;
		j := j + 1
	end;
	s[j] := ENDSTR
end;
