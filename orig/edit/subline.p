{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ subline -- substitute sub for pat in lin and print }
procedure subline (var lin, pat, sub : string);
var
	i, lastm, m : integer;
	junk : boolean;
#include "amatch.p"
#include "putsub.p"
begin
	lastm := 0;
	i := 1;
	while (lin[i] <> ENDSTR) do begin
		m := amatch(lin, i, pat, 1);
		if (m > 0) and (lastm <> m) then begin
			{ replace matched text }
			putsub(lin, i, m, sub);
			lastm := m
		end;
		if (m = 0) or (m = i) then begin
			{ no match or null match }
			putc(lin[i]);
			i := i + 1
		end
		else	{ skip matched text }
			i := m
	end
end;
