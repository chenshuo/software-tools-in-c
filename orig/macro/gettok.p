{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ gettok -- get token for define }
function gettok (var token : string; toksize : integer)
		: character;
var
	i : integer;
	done : boolean;
begin
	i := 1;
	done := false;
	while (not done) and (i < toksize) do
		if (isalphanum(getpbc(token[i]))) then
			i := i + 1
		else
			done := true;
	if (i >= toksize) then 
		error('define: token too long');
	if (i > 1) then begin	{ some alpha was seen }
		putback(token[i]);
		i := i - 1
	end;
	{ else single non-alphanumeric }
	token[i+1] := ENDSTR;
	gettok := token[1]
end;
