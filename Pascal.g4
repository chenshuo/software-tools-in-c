grammar Pascal;

sourceFile:
	procedureOrFunctionDeclaration *
	EOF
	;

procedureOrFunctionDeclaration:
	procedureDeclaration ';'
	| functionDeclaration ';'
	;

procedureDeclaration:
	'procedure' ID (formalParameterList)? ';'
	block
	;

functionDeclaration:
	'function' ID (formalParameterList)? ':' typeIdentifier ';'
	block
	;

formalParameterList:
	'(' formalParameterSection ( ';' formalParameterSection )* ')'
	;

formalParameterSection :
	parameterGroup
	| 'var' parameterGroup
	;

parameterGroup:
	identifierList ':' typeIdentifier
	;

block :
	constantDefinitionPart ?
	typeDefinitionPart ?
	variableDeclarationPart ?
	compoundStatement
	;

constantDefinitionPart :
	'const' constantDefinition ( ';' constantDefinition )* ';'
	;

constantDefinition :
	ID '=' constant
	;

constant :
	unsignedInteger		# positive
	| '-' unsignedInteger	# negative
	| ID			# const
	;

/////
typeDefinitionPart :
	'type' typeDefinition ( ';' typeDefinition )* ';'
	;

typeDefinition :
	ID '=' type
	;

type
	: scalarType
	| subrangeType
	| typeIdentifier
	| structuredType
	;

scalarType
	: '(' identifierList ')'
	;

subrangeType :
	constant '..' constant
	;

typeIdentifier :
	'char' | ID ;

structuredType
	: 'packed' unpackedStructuredType
	| unpackedStructuredType
	;

unpackedStructuredType
	: arrayType
	// | recordType
	// | fileType
	;

arrayType:
	'array' '[' (typeIdentifier | subrangeType) ']' 'of' type
	;

/////
variableDeclarationPart :
	'var' variableDeclaration (';' variableDeclaration )* ';'
	;

variableDeclaration:
	identifierList ':' type ;

identifierList :
	ID ( ',' ID )*
	;

statement :
	simpleStatement
	| structuredStatement
	;

simpleStatement
	: assignmentStatement
	| procedureStatement
	| emptyStatement
	;

assignmentStatement
	: variable ASSIGN expression
	;

procedureStatement :
	ID
	| functionDesignator
	;

emptyStatement
	:
	;

structuredStatement
	: compoundStatement
	| conditionalStatement
	| loopStatement
	;

compoundStatement:
	'begin'
	  statements
	'end'
	;

statements :
	statement (';' statement )*
	;

conditionalStatement
	: ifStatement
	| caseStatement
	;

ifStatement :
	'if' expression 'then' statement
	( 'else' statement )?
	;

caseStatement
	: 'case' expression 'of'
		caseListElement ( ';' caseListElement )*
	  ( ';' 'othercases' statements )?
	  ';' ?
	  ('endcases' | 'end')
	;

caseListElement
	: constList ':' statement
	;

constList :
	caseConst ( ',' caseConst )*
	;

caseConst
	: unsignedInteger
	| ID
	;

loopStatement
	: whileStatement
	| repeatStatement
	| forStatement
	;

whileStatement
	: 'while' expression 'do' statement
	;

repeatStatement
	: 'repeat' statements 'until' expression
	;
forStatement
	: 'for' ID ':=' expression direction expression 'do' statement
	;

direction : 'to' | 'downto' ;

variable:
	ID ('[' expression (',' expression)* ']' | '.' ID | '^')*
	;

/////////////////////////////////////// Expression

expression
	: simpleExpression
	  ( ('=' | '<>' | '<' | '<=' | '>' | '>=' | 'in') simpleExpression )*
	;

simpleExpression
	: term ( ('+' | '-' | 'or') term )*
	;

term
	: signedFactor ( ('*' | '/' | 'div' | 'mod' | 'and') signedFactor )*
	;

signedFactor
	: ('+'|'-')? factor
	;

factor
	: variable
	| '(' expression ')'
	| functionDesignator
	| unsignedConstant
	| set
	| 'not' factor
	;

functionDesignator:
	ID '(' parameterList ')'
	| functionDesignator '(' parameterList ')'
	;

parameterList
	: actualParameter ( COMMA actualParameter )*
	;

actualParameter
	: expression
	| expression ':' DIGITS
	;

unsignedConstant
	: unsignedNumber
	| STRING
	| 'nil'
	;

set : '[' elementList ']' ;

elementList
    : element ( ',' element )*
    ;

element
    : expression ( '..' expression )?
    ;

unsignedInteger : DIGITS ;

unsignedNumber: DIGITS | FLOAT ;

//
//  Lexer
//

KEYWORDS
	: 'and'
	| 'array'
	| 'begin'
	| 'case'
	| 'char'
	| 'const'
	| 'downto'
	| 'else'
	| 'end'
	| 'endcases'
	| 'file'
	| 'function'
	| 'forward'
	| 'if'
	| 'label'
	| 'of'
	| 'packed'
	| 'procedure'
	| 'program'
	| 'record'
	| 'then'
	| 'to'
	;

VAR : 'var' ;

WS : [ \t\r\n]+ -> channel(HIDDEN) ;
COMMENT : '{' (~'}')* '}' -> channel(HIDDEN) ;
INCLUDE: '#include "' [a-z0-9.]+ '"' -> channel(HIDDEN);

ID : [a-zA-Z] [a-zA-Z0-9_]* ;
DIGITS : [0-9]+ ;
FLOAT : DIGITS '.' DIGITS ;

STRING : '\'' ('\'\'' | ~('\''))* '\'' ;

PLUS : '+';
MINUS : '-';
MULTIPLY : '*' ;
DIVIDE : '/' ;

ASSIGN : ':=' ;
COMMA: ',' ;
SEMI: ';' ;
COLON : ':' ;

EQUAL: '=' ;
NE : '<>' ;
LT : '<' ;
LE : '<=' ;
GT : '>' ;
GE : '>=' ;

DOTDOT: '..' ;
DOT : '.' ;

LPAREN : '(' ;
RPAREN : ')' ;
LBRACK : '[' ;
RBRACK : ']' ;
POINTER : '^' ;

