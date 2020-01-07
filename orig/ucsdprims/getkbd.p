{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ getkbd -- read character from keyboard }
function getkbd (var c : character) : character;
var
	done : boolean;
	ch : char;
begin
	if (kbdn <= 0) then begin
		kbdnext := 1;
		done := false;
		if (kbdn = -2) then begin
			readln;
			kbdn := 0
		end
		else if (kbdn < 0) then
			done := true;
		while (not done) do begin
			kbdn := kbdn + 1;
			done := true;
			if (eof) then
				kbdn := -1
			else if (eoln) then begin
				kbdn := kbdn - 1;
				kbdline[kbdn] := NEWLINE
			end
			else if (MAXSTR-1 <= kbdn) then begin
				writeln('line too long');
				kbdline[kbdn] := NEWLINE
			end
			else begin
				read(ch);
				kbdline[kbdn] := ord(ch);
				if (kbdline[kbdn] <> BACKSPACE) then
					{ do nothing }
				else if (1 < kbdn) then
					kbdn := kbdn - 2
				else
					kbdn := kbdn - 1;
				done := false
			end
		end
	end;
	if (kbdn <= 0) then
		c := ENDFILE
	else begin
		c := kbdline[kbdnext];
		kbdnext := kbdnext + 1;
		if (c = NEWLINE) then
			kbdn := -2
		else
			kbdn := kbdn - 1
	end;
	getkbd := c;
end;
