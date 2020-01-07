{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ globdefs (UCB) -- global constants, types and variables }

const

{ standard file descriptors. subscripts in open, etc. }
	STDIN = 1;		{ these are not to be changed }
	STDOUT = 2;
	STDERR = 3;

{ other io-related stuff }
	IOERROR = 0;	{ status values for open files }
	IOAVAIL = 1;
	IOREAD = 2;
	IOWRITE = 3;
	MAXOPEN = 10;	{ maximum number of open files }

{ universal manifest constants }
	ENDFILE = -1;
	ENDSTR = 0;		{ null-terminated strings }
	MAXSTR = 100;	{ longest possible string }

{ ascii character set in decimal }
	BACKSPACE = 8;
	TAB = 9;
	NEWLINE = 10;
	BLANK = 32;
	EXCLAM = 33;	{ ! }
	DQUOTE = 34;	{ " }
	SHARP = 35;		{ # }
	DOLLAR = 36;	{ $ }
	PERCENT = 37;	{ % }
	AMPER = 38;		{ & }
	SQUOTE = 39;	{ ' }
	ACUTE = SQUOTE;
	LPAREN = 40;	{ ( }
	RPAREN = 41;	{ ) }
	STAR = 42;		{ * }
	PLUS = 43;		{ + }
	COMMA = 44;		{ , }
	MINUS = 45;		{ - }
	DASH = MINUS;
	PERIOD = 46;	{ . }
	SLASH = 47;		{ / }
	COLON = 58;		{ : }
	SEMICOL = 59;	{ ; }
	LESS = 60;		{ < }
	EQUALS = 61;	{ = }
	GREATER = 62;	{ > }
	QUESTION = 63;	{ ? }
	ATSIGN = 64;	{ @ }
	ESCAPE = ATSIGN;
	LBRACK = 91;	{ [ }
	BACKSLASH = 92;	{ \e }
	RBRACK = 93;	{ ] }
	CARET = 94;		{ ^ }
	UNDERLINE = 95;	{ _ }
	GRAVE = 96;		{ ` }
	LETA = 97;		{ lower case ... }
	LETB = 98;
	LETC = 99;
	LETD = 100;
	LETE = 101;
	LETF = 102;
	LETG = 103;
	LETH = 104;
	LETI = 105;
	LETJ = 106;
	LETK = 107;
	LETL = 108;
	LETM = 109;
	LETN = 110;
	LETO = 111;
	LETP = 112;
	LETQ = 113;
	LETR = 114;
	LETS = 115;
	LETT = 116;
	LETU = 117;
	LETV = 118;
	LETW = 119;
	LETX = 120;
	LETY = 121;
	LETZ = 122;
	LBRACE = 123;	{ left brace }
	BAR = 124;		{ | }
	RBRACE = 125;	{ right brace }
	TILDE = 126;	{ ~ }

type
	character = -1..127;  { byte-sized. ascii + other stuff }
	string = array [1..MAXSTR] of character;
	filedesc = IOERROR..MAXOPEN;
	ioblock = record	{ to keep track of open files }
		filevar : text;
		mode : IOERROR..IOWRITE;
	end;

var
	openlist : array [1..MAXOPEN] of ioblock; { open files }
