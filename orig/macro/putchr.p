{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putchr -- put single char on output or evaluation stack }
procedure putchr (c : character);
begin
	if (cp <= 0) then 
		putc(c)
	else begin
		if (ep > EVALSIZE) then 
			error('macro: evaluation stack overflow');
		evalstk[ep] := c;
		ep := ep + 1
	end
end;
