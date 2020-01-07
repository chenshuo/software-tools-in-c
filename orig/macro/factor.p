{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ factor -- evaluate factor of arithmetic expression }
function factor (var s : string; var i : integer)
		 : integer;
begin
	if (gnbchar(s, i) = LPAREN) then begin
		i := i + 1;
		factor := expr(s, i);
		if (gnbchar(s, i) = RPAREN) then
			i := i + 1
		else
			message('macro: missing paren in expr')
	end
	else
		factor := ctoi(s, i)
end;
