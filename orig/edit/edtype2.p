{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ edittype -- types for scratch-file version of edit }
type
	stcode = (ENDDATA, ERR, OK);
	buftype =
		record
			txt : integer;	{ text of line }
			mark : boolean	{ mark for line }
		end;
