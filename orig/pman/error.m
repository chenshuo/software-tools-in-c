{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
.NM error print a message and exit
.SY
.UL "procedure error ('your message here');"
.FU
.UL error
writes the literal string specified to a highly visible place,
such as the user's terminal,
then performs an abnormal exit.
.RE
Nothing.
Moreover,
.UL error
never returns control to its caller.
