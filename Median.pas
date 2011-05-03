// Author: Wayne Buchner
// Student ID: 6643140
// Date: 03/04/2011
// Program: Median.pas
// Description: Calculate the Median value from an array

program Median;

function Median (const  data: array of Integer):Double;
var
	startIdx, endIdx : Integer;
	begin
	startIdx := Low(data);
	endIdx := High(data);
	
	while (startIdx <> endIdx) and (startIdx < endIdx) do
		begin
			startIdx := startIdx + 1;

			endIdx := endIdx - 1;
			WriteLn('StartIdx =',startIdx,' EndIdx =',endIdx);
		end;
	
	if startIdx = endIdx then
	begin
	result := data[startIdx];	
	end
	else
	begin
	WriteLn('#Median ',data[startIdx],' + ', data[endIdx],' = ',(data[startIdx]+data[endIdx])/2:4:2);
	result := (data[startIdx] + data[endIdx])/2;	
	end;

end;

procedure Main();
var
	data: array [0..7] of Integer;
begin
	data[0] := 1;
	data[1] := 2;
	data[2] := 3;
	data[3] := 4;
	data[4] := 5;
	data[5] := 6;
	data[6] := 7;
	data[7] := 8;
	
	WriteLn(Median(data):4:2);
end;

begin
	Main();
end.