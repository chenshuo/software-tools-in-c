{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ dowrite -- write lines n1..n2 into file }
function dowrite (n1, n2 : integer; var fil : string) : stcode;
var
	i : integer;
	fd : filedesc;
	line : string;
begin
	fd := create(fil, IOWRITE);
	if (fd = IOERROR) then 
		dowrite := ERR
	else begin
		for i := n1 to n2 do begin
			gettxt(i, line);
			putstr(line, fd)
		end;
		close(fd);
		putdec(n2-n1+1, 1);
		putc(NEWLINE);
		dowrite := OK
	end
end;
