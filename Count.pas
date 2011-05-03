// Author: Wayne Buchner
// Student ID: 6643140
// Date: 03/04/2011
// Program: Median.pas
// Description: Calculate the Median value from an array

program Count;

var
	e,pos : Integer;
	s : array [0..3] of Integer;
begin
	e := 5;
	pos := 0;
	s[0] := 2;
	s[1] := 4;
	s[2] := 6;
	s[3] := 8;
	WriteLn(High(s));
	while (pos <> Length(s)) and (s[pos] < e)  do
	begin
		WriteLn('sum of s :',sum(s));
		WriteLn(pos,' ',s[pos]);
		pos :=pos + 1;
	end;
	WriteLn('pos should equal :',pos);
end.