{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ term -- evaluate term of arithmetic expression }
function term (var s : string; var i : integer) : integer;
var
	v : integer;
	t : character;
#include "factor.p"
begin
	v := factor(s, i);
	t := gnbchar(s, i);
	while (t in [STAR, SLASH, PERCENT]) do begin
		i := i + 1;
		case t of
		STAR:
			v := v * factor(s, i);
		SLASH:
			v := v div factor(s, i);
		PERCENT:
			v := v mod factor(s, i)
		end;
		t := gnbchar(s, i)
	end;
	term := v
end;
