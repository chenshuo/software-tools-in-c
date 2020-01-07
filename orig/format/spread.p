{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ spread -- spread words to justify right margin }
procedure spread (var buf : string;
		 outp, nextra, outwds : integer);
var
	i, j, nb, nholes : integer;
begin
	if (nextra > 0) and (outwds > 1) then begin
		dir := 1 - dir;	{ reverse previous direction }
		nholes := outwds - 1;
		i := outp - 1;
		j := min(MAXSTR-2, i+nextra); { room for NEWLINE }
		while (i < j) do begin		{ and ENDSTR }
			buf[j] := buf[i];
			if (buf[i] = BLANK) then begin
				if (dir = 0) then 
					nb := (nextra-1) div nholes + 1
				else
					nb := nextra div nholes;
				nextra := nextra - nb;
				nholes := nholes - 1;
				while (nb > 0) do begin
					j := j - 1;
					buf[j] := BLANK;
					nb := nb - 1
				end
			end;
			i := i - 1;
			j := j - 1
		end
	end
end;
