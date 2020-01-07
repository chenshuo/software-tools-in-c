{ Copyright (C) 1981 by Bell Laboratories, Inc., and Whitesmiths Ltd. }
{ blkmove -- move block of lines n1..n2 to after n3 }
procedure blkmove (n1, n2, n3 : integer);
begin
	if (n3 < n1-1) then begin
		reverse(n3+1, n1-1);
		reverse(n1, n2);
		reverse(n3+1, n2)
	end
	else if (n3 > n2) then begin
		reverse(n1, n2);
		reverse(n2+1, n3);
		reverse(n1, n3)
	end
end;
