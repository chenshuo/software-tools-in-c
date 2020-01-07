{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getdef -- get name and definition }
procedure getdef (var token : string; toksize : integer;
		var defn : string; defsize : integer);
var
	i, nlpar : integer;
	c : character;
begin
	token[1] := ENDSTR;	{ in case of bad input }
	defn[1] := ENDSTR;
	if (getpbc(c) <> LPAREN) then 
		message('define: missing left paren')
	else if (not isletter(gettok(token, toksize))) then 
		message('define: non-alphanumeric name')
	else if (getpbc(c) <> COMMA) then 
		message('define: missing comma in define')
	else begin	{ got '(name,' so far }
		while (getpbc(c) = BLANK) do
			;	{ skip leading blanks }
		putback(c);	{ went one too far }
		nlpar := 0;
		i := 1;
		while (nlpar >= 0) do begin
			if (i >= defsize) then 
				error('define: definition too long')
			else if (getpbc(defn[i]) = ENDFILE) then 
				error('define: missing right paren')
			else if (defn[i] = LPAREN) then 
				nlpar := nlpar + 1
			else if (defn[i] = RPAREN) then 
				nlpar := nlpar - 1;
			{ else normal character in defn[i] }
			i := i + 1
		end;
		defn[i-1] := ENDSTR
	end
end;
