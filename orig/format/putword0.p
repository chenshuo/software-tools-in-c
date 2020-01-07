{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ putword -- put word in outbuf }
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
		break	{ flush previous line }
	end;
	scopy(wordbuf, 1, outbuf, outp+1);
	outp := last;
	outbuf[outp] := BLANK;	{ blank between words }
	outw := outw + w + 1;	{ 1 for blank }
	outwds := outwds + 1
end;
