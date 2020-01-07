{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ defvar -- var declarations for define }
var
	hashtab : array [1..HASHSIZE] of ndptr;
	ndtable : charbuf;
	nexttab : charpos;	{ first free position in ndtable }
	buf : array [1..BUFSIZE] of character;	{ for pushback }
	bp : 0..BUFSIZE;	{ next available character; init=0 }
