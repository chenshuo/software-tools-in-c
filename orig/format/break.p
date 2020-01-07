{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ break -- end current filled line }
procedure break;
begin
	if (outp > 0) then begin
		outbuf[outp] := NEWLINE;
		outbuf[outp+1] := ENDSTR;
		put(outbuf)
	end;
	outp := 0;
	outw := 0;
	outwds := 0
end;
