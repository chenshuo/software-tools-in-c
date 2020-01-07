{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ dosub -- select substring }
procedure dosub (var argstk : posbuf; i, j : integer);
var
	ap, fc, k, nc : integer;
	temp1, temp2 : string;
begin
	if (j - i >= 3) then begin
		if (j - i < 4) then 
			nc := MAXTOK
		else begin
			cscopy(evalstk, argstk[i+4], temp1);
			k := 1;
			nc := expr(temp1, k)
		end;
		cscopy(evalstk, argstk[i+3], temp1);	{ origin }
		ap := argstk[i+2];	{ target string }
		k := 1;
		fc := ap + expr(temp1, k) - 1;	{ first char }
		cscopy(evalstk, ap, temp2);
		if (fc >= ap) and (fc < ap+length(temp2)) then begin
			cscopy(evalstk, fc, temp1);
			for k := fc+min(nc,length(temp1))-1 downto fc do
				putback(evalstk[k])
		end
	end
end;
