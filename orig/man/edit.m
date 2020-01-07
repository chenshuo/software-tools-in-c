{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM edit edit text files
.SY
.UL "edit [file]"
.FU
.UL edit
is an interactive text editor that reads command lines from its input
and writes display information, upon command, to its output.
It works by reading text files on command into an internal ``buffer''
(which may be quite large), displaying and modifying the buffer contents
by other commands, then writing all or part of the buffer to text files,
also on command.
The buffer is organized as a sequence of lines, numbered from 1;
lines are implicitly renumbered as text is added or deleted.
.IP
Context searches and substitutions are specified by writing text patterns,
following the same rules for building patterns as used by
.UL find .
Substitutions specify replacement text following the same rules as used
by the program
.UL change .
.IP
Line numbers are formed from the following components:
.P1
.if t .ta .6i
.if n .ta 12
\f2n\fP	\f1a decimal number\fP
\&.	\f1the current line (``dot'')\fP
$	\f1the last line\fP
/\f2pattern\fP/	\f1a forward context search\fP
\e\f2pattern\fP\e	\f1a backward context search\fP
.P2
.IP
Components may be combined with
.UL +
or
.UL - ,
as in, for example,
.P1
.if t .ta .6i 2.2i
.if n .ta 12
\&.+1	\f1sum of \fP.\f1 and 1\fP
\&$-5	\f1five lines before \fP$	\f1(\f2continued on next page\f1)
.P2
.D2
.D1
.IP
Line numbers are separated by commas or semicolons;
a semicolon sets the current line to the most recent line number
before proceeding.
.IP
Commands may be preceded by an arbitrary number of line numbers
(except for
.UL e ,
.UL f
and
.UL q ,
which require that none be present).
The last one or two are used as needed.
If two line numbers are needed and only one is specified,
it is used for both.
If no line numbers are specified, a default rule is applied:
.P1
.if t .ta .6i
.if n .ta 12
(.)\f1	use the current line\fP
(.+1)\f1	use the next line\fP
(.,.)\f1	use the current line for both line numbers\fP
(1,$)\f1	use all lines\fP
.P2
....D2
....D1
.IP
In alphabetical order, the commands and their default line numbers are:
.P1 .3i
.if t .ta 0.35i 1.1i
.if n .ta 6 15
(.)	a	\f1append text after line (text follows)\fP
(.,.)	c	\f1change text (text follows)\fP
(.,.)	dp	\f1delete text\fP
	e \f2file\fP	\f1edit\fP \f2file\fP\f1 after discarding all previous text, remember file name
.ft P
	f \f2file\fP	\f1print file name, remember file name\fP
(.)	i	\f1insert text before line (text follows)\fP
(.,.)	m \f2line3\fP p	\f1move text to after\fP \f2line3\fP
(.,.)	p	\f1print text\fP
	q	\f1quit\fP
(.)	r \f2file\fP	\f1read\fP \f2file\fP\f1, appending after line\fP
(.,.)	s/\f2pat\fP/\f2new\fP/gp	\f1substitute\fP \f2new\fP \f1for occurrence of\fP \f2pat\fP
		\f1(\fPg\f1 implies for each occurrence across line)\fP
(1,$)	w \f2file\fP	\f1write\fP \f2file\fP \f1(leaves current state unaltered)\fP
(.)	=p	\f1print line number\fP
(.+1)	\f2newline\fP	\f1print one line\fP
.P2
.IP
The trailing
.UL p ,
which is optional, causes the last affected line to be printed.
Dot is set to the last affected line, except for
.UL f ,
.UL w ,
and
.UL = ,
for which it is unchanged.
.IP
Text entered with 
.UL a ,
.UL c
and
.UL i
is terminated with a line containing just a
.UL . '. `
.IP
The global prefixes cause repeated execution of a command, once for
each line that matches
.UL g ) (
or does not match
.UL x ) (
a specified text pattern:
.P1
(1,$)	g/\f2pattern\fP/\f2command\fP
(1,$)	x/\f2pattern\fP/\f2command\fP
.P2
.ul
command
can be anything but
.UL a ,
.UL c ,
.UL i 
or
.UL q ,
and may be preceded by line numbers as usual.
Dot is set to the matched line before
.ul
command
is done.
.IP
If the command line argument
.UL file
is present,
then the editor behaves as if its input began with the command
.UL "e file" .
The first filename used is remembered, so that a subsequent
.UL e ,
.UL f ,
.UL r ,
or
.UL w
command can be written with no filename to refer to the remembered filename.
A filename given with
.UL e
or
.UL f
replaces any remembered filename.
.EG
Don't be silly.
