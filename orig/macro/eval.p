{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ eval -- expand args i..j: do built-in or push back defn }
procedure eval (var argstk : posbuf; td : sttype;
		i, j : integer);
var
	argno, k, t : integer;
	temp : string;
begin
	t := argstk[i];
	if (td = DEFTYPE) then 
		dodef(argstk, i, j)
	else if (td = EXPRTYPE) then 
		doexpr(argstk, i, j)
	else if (td = SUBTYPE) then 
		dosub(argstk, i, j)
	else if (td = IFTYPE) then 
		doif(argstk, i, j)
	else if (td = LENTYPE) then
		dolen(argstk, i, j)
	else if (td = CHQTYPE) then
		dochq(argstk, i, j)
	else begin
		k := t;
		while (evalstk[k] <> ENDSTR) do
			k := k + 1;
		k := k - 1;	{ last character of defn }
		while (k > t) do begin
			if (evalstk[k-1] <> ARGFLAG) then 
				putback(evalstk[k])
			else begin
				argno := ord(evalstk[k]) - ord('0');
				if (argno >= 0) and (argno < j-i) then begin
					cscopy(evalstk, argstk[i+argno+1], temp);
					pbstr(temp)
				end;
				k := k - 1	{ skip over $ }
			end;
			k := k - 1
		end;
		if (k = t) then 	{ do last character }
			putback(evalstk[k])
	end
end;
