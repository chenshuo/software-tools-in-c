{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ edittype -- types for in-memory version of edit }
type
	stcode = (ENDDATA, ERR, OK);	{ status returns }
	buftype =	{ in-memory edit buffer entry }
		record
			txt : string;	{ text of line }
			mark : boolean	{ mark for line }
		end;
