{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ clrbuf (scratch file) -- dispose of scratch file }
procedure clrbuf;
begin
	close(scrin);
	close(scrout);
	remove(edittemp)
end;
