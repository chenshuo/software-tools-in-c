{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ editcons -- const declarations for edit }
const
	MAXLINES = 100;	{ set small for testing }
	MAXPAT = MAXSTR;
	CLOSIZE = 1;	{ size of a closure entry }
	DITTO = -1;
	CLOSURE = STAR;
	BOL = PERCENT;
	EOL = DOLLAR;
 	ANY = QUESTION;
	CCL = LBRACK;
	CCLEND = RBRACK;
	NEGATE = CARET;
	NCCL = EXCLAM;
	LITCHAR = LETC;
	CURLINE = PERIOD;
	LASTLINE = DOLLAR;
	SCAN = SLASH;
 	BACKSCAN = BACKSLASH;

	ACMD = LETA;	{ = ord('a') }
	CCMD = LETC;
	DCMD = LETD;
	ECMD = LETE;
	EQCMD = EQUALS;
	FCMD = LETF;
	GCMD = LETG;
	ICMD = LETI;
	MCMD = LETM;
	PCMD = LETP;
	QCMD = LETQ;
	RCMD = LETR;
	SCMD = LETS;
	WCMD = LETW;
 	XCMD = LETX;
