{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ dochq -- change quote characters }
procedure dochq (var argstk : posbuf; i, j : integer);
var
	temp : string;
	n : integer;
begin
	cscopy(evalstk, argstk[i+2], temp);
	n := length(temp);
	if (n <= 0) then begin
		lquote := ord(GRAVE);
		rquote := ord(ACUTE)
	end
	else if (n = 1) then begin
		lquote := temp[1];
		rquote := lquote
	end
	else begin
		lquote := temp[1];
		rquote := temp[2]
	end
end;
