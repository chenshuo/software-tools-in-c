{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ macvar -- var declarations for macro }
var
	buf : array [1..BUFSIZE] of character;	{ for pushback }
	bp : 0..BUFSIZE;	{ next available character; init=0 }

	hashtab : array [1..HASHSIZE] of ndptr;
	ndtable : charbuf;
	nexttab : charpos;	{ first free position in ndtable }

	callstk : posbuf;	{ call stack }
	cp : pos;			{ current call stack position }
	typestk : array[1..CALLSIZE] of sttype;	{ type }
	plev : array [1..CALLSIZE] of integer;	{ paren level }
	argstk : posbuf;	{ argument stack for this call }
	ap : pos;			{ current argument position }
	evalstk : charbuf;	{ evaluation stack }
	ep : charpos;		{ first character unused in evalstk }

	{ built-ins: }
	defname : string;	{ value is 'define' }
	exprname : string;	{ value is 'expr' }
	subname : string;	{ value is 'substr' }
	ifname : string;	{ value is 'ifelse' }
	lenname : string;	{ value is 'len' }
	chqname : string;	{ value is 'changeq' }

	null : string;		{ value is '' }
	lquote : character;	{ left quote character }
	rquote : character;	{ right quote character }
