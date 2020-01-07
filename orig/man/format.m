{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM format produce formatted output
.SY
.UL "format"
.FU
.UL format
reads its input a line at a time and writes a neatly formatted version
of the input text to the output, with page headers and footers and with
output lines filled to a uniform right margin.
Input text lines may have interspersed among them command lines
that alter this default mode of formatting.
A command line consists of a leading period, followed by a two letter
code, possibly with optional arguments following the first sequence of
blanks and tabs.
.IP
Certain commands cause a ``break'' in the processing of input text lines,
i.e., any partially filled line is output and a new line is begun.
In the following command summary, the letter
.ul
n
stands for an optional numeric argument.
If a numeric argument is preceded by a
.UL +
or
.UL - ,
the current value is 
.ul
changed
by this amount;
otherwise the argument represents the new value.
If no argument is given,
the default value is used.
.P1
.if t .ta .6i 1.1i 2i
command	break?	default	function
.WS
.if t .ta .05i .7i 1.2i 2i
\f(\*(pf	@bp \f2n	\f1yes	\f2n\f1=+1	begin page numbered \f2n\fP
\f(\*(pf	@br		\f1yes	\f1cause break\fP
\f(\*(pf	@ce \f2n	\f1yes	\f2n\f1=1	center next \f2n\f1 lines\fP
\f(\*(pf	@fi	\f1yes		start filling\fP
\f(\*(pf	@fo\f2 str	\f1no	empty	footer title\fP
\f(\*(pf	@he\f2 str	\f1no	empty	header title\fP
\f(\*(pf	@in \f2n	\f1no\f2	n\f1=0	indent \f2n \f1spaces\fP
\f(\*(pf	@ls \f2n	\f1no\f2	n\f1=1	line spacing is \f2n \f1\fP
\f(\*(pf	@nf	\f1yes			stop filling\fP
\f(\*(pf	@pl \f2n	\f1no	\f2n\f1=66	set page length to\f2 n\fP
\f(\*(pf	@rm \f2n	\f1no	\f2n\f1=60	set right margin to\f2 n\fP
\f(\*(pf	@sp \f2n	\f1yes	\f2n\f1=1	space down \f2n\f1 lines or to bottom of page\fP
\f(\*(pf	@ti \f2n	\f1yes	\f2n\f1=0	temporary indent of\f2 n\fP
\f(\*(pf	@ul \f2n	\f1no	\f2n\f1=1	underline words from next \f2n\f1 lines \fP
.P2
.IP
A blank input line causes a break and is passed
to the output unchanged.
Similarly, an input line that begins with blanks causes a break
and is written to the output with the leading blanks preserved.
Thus a document formatted in the conventional manner by hand will retain
its original paragraph breaks and indentation.
