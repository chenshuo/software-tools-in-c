{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gnbchar -- get next non-blank character }
function gnbchar (var s : string; var i : integer)
		: character;
begin
	while (s[i] in [BLANK, TAB, NEWLINE]) do
		i := i + 1;
	gnbchar := s[i]
end;
