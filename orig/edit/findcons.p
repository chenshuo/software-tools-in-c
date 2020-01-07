{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ findcons -- const declarations for find }
const
	MAXPAT = MAXSTR;
	CLOSIZE = 1;	{ size of a closure entry }
	CLOSURE = STAR;
 	BOL = PERCENT;
	EOL = DOLLAR;
 	ANY = QUESTION;
	CCL = LBRACK;
	CCLEND = RBRACK;
	NEGATE = CARET;
	NCCL = EXCLAM;	{ cannot be the same as NEGATE }
	LITCHAR = LETC;	{ ord('c') }
