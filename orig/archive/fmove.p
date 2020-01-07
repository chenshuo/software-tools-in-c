{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ fmove -- move file name1 to name2 }
procedure fmove (var name1, name2 : string);
var
	fd1, fd2 : filedesc;
begin
	fd1 := mustopen(name1, IOREAD);
	fd2 := mustcreate(name2, IOWRITE);
	fcopy(fd1, fd2);
	close(fd1);
	close(fd2)
end;
