{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ doread -- read "fil" after line n }
function doread (n : integer; var fil : string) : stcode;
var
	count : integer;
	t : boolean;
	stat : stcode;
	fd : filedesc;
	inline : string;
begin
	fd := open(fil, IOREAD);
	if (fd = IOERROR) then 
		stat := ERR
	else begin
		curln := n;
		stat := OK;
		count := 0;
		repeat
			t := getline(inline, fd, MAXSTR);
			if (t) then begin
				stat := puttxt(inline);
				if (stat <> ERR) then 
					count := count + 1
			end
		until (stat <> OK) or (t = false);
		close(fd);
		putdec(count, 1);
		putc(NEWLINE)
	end;
	doread := stat
end;
