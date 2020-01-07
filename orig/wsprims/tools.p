{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ tools.h -- definitions and types for WS primitives }

#define ENDFILE	-1	/* character constants */
#define ENDSTR	0
#define BACKSPACE	8
#define TAB	9
#define NEWLINE	10
#define BLANK	32
#define EXCLAM	33
#define DQUOTE	34
#define SHARP	35
#define DOLLAR	36
#define PERCENT	37
#define AMPER	38
#define SQUOTE	39
#define ACUTE	SQUOTE
#define LPAREN	40
#define RPAREN	41
#define STAR	42
#define PLUS	43
#define COMMA	44
#define MINUS	45
#define DASH	MINUS
#define PERIOD	46
#define SLASH	47
#define COLON	58
#define SEMICOL	59
#define LESS	60
#define EQUALS	61
#define GREATER	62
#define QUESTION	63
#define ATSIGN	64
#define ESCAPE	ATSIGN
#define LBRACK	91
#define BACKSLASH	92
#define RBRACK	93
#define CARET	94
#define UNDERLINE	95
#define GRAVE	96
#define LETA	97
#define LETB	98
#define LETC	99
#define LETD	100
#define LETE	101
#define LETF	102
#define LETG	103
#define LETH	104
#define LETI	105
#define LETJ	106
#define LETK	107
#define LETL	108
#define LETM	109
#define LETN	110
#define LETO	111
#define LETP	112
#define LETQ	113
#define LETR	114
#define LETS	115
#define LETT	116
#define LETU	117
#define LETV	118
#define LETW	119
#define LETX	120
#define LETY	121
#define LETZ	122
#define LBRACE	123
#define BAR	124
#define RBRACE	125
#define TILDE	126

#define IOERROR	-1
#define STDIN	0
#define STDOUT	1
#define STDERR	2
#define MAXOPEN	8

#define IOREAD	0
#define IOWRITE	1

#define MAXSTR	100

type
	character = -128..127;
	filedesc = integer;
	string = array [1..MAXSTR] of character;

#define message(str)	writeln(errout, str)
#define error(str)	begin message(str); exit(false) end
#define isdigit(c)	((ord('0') <= c) and (c <= ord('9')))
