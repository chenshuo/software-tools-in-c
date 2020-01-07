{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ skipbl -- skip blanks and tabs at s[i]... }
procedure skipbl (var s : string; var i : integer);
begin
	while (s[i] = BLANK) or (s[i] = TAB) do 
		i := i + 1
end;
