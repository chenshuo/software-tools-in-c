{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ miscellaneous functions for things like
	islower
	isupper
	isletter
	isalphanum

 All of these work on 'character' data type
 and return boolean.
}

{ islower(n) -- true if n is lower case }
function islower (n : character) : boolean;

begin
	islower := (ord('a') <= n) and (n <= ord('z'));
end;

{ isupper(n) -- true if n is upper case }
function isupper (n : character) : boolean;

begin
	isupper := (ord('A') <= n) and (n <= ord('Z'));
end;

{ isletter(n) -- true if n is a letter of either case }
function isletter (n : character) : boolean;

begin
	isletter := (ord('a') <= n) and (n <= ord('z'))
		or (ord('A') <= n) and (n <= ord('Z'));
end;

{ isalphanum -- true if letter or digit }
function isalphanum (n : character) : boolean;

begin
	isalphanum := isletter(n) or isdigit(n);
end;
