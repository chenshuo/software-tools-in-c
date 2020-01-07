{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putword -- put word in outbuf; does margin justification }
procedure putword (var wordbuf : string);
var
	last, llval, nextra, w : integer;
begin
	w := width(wordbuf);
	last := length(wordbuf) + outp + 1;	{ new end of outbuf }
	llval := rmval - tival - inval;
	if (outp > 0)
	  and ((outw+w > llval) or (last >= MAXSTR)) then begin
		last := last - outp;	{ remember end of wordbuf }
		nextra := llval - outw + 1;
		if (nextra > 0) and (outwds > 1) then begin
			spread(outbuf, outp, nextra, outwds);
			outp := outp + nextra
		end;
		break	{ flush previous line }
	end;
	scopy(wordbuf, 1, outbuf, outp+1);
	outp := last;
	outbuf[outp] := BLANK;	{ blank between words }
	outw := outw + w + 1;	{ 1 for blank }
	outwds := outwds + 1
end;
