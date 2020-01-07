{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ sccopy -- copy string s to cb[i]... }
procedure sccopy (var s : string; var cb : charbuf;
		i : charpos);
var
	j : integer;
begin
	j := 1;
	while (s[j] <> ENDSTR) do begin
		cb[i] := s[j];
		j := j + 1;
		i := i + 1
	end;
	cb[i] := ENDSTR
end;
