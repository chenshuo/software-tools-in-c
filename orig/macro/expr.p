{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ expr -- recursive expression evaluation }
function expr (var s : string; var i : integer) : integer;
var
	v : integer;
	t : character;
#include "gnbchar.p"
#include "term.p"
begin
	v := term(s, i);
	t := gnbchar(s, i);
	while (t in [PLUS, MINUS]) do begin
		i := i + 1;
		if (t = PLUS) then
			v := v + term(s, i)
		else
			v := v - term(s, i);
		t := gnbchar(s, i)
	end;
	expr := v
end;
