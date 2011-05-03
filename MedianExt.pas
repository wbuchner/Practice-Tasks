// Author: Wayne Buchner
// Student ID: 6643140
// Date: 03/04/2011
// Program: Median.pas
// Description: Calculate the Median value from an array

program Median;

uses SysUtils, math;

function Median (const  data: array of Integer):Double;
var
	dataLength : Integer;
begin
	dataLength := Floor(Length(data)/2);
	if Length(data) Mod 2 = 0 then
		begin
			result := (data[dataLength-1] + data[dataLength])/2;
		end
	else
		begin
			result := data[dataLength];
		end;
end;

procedure Main();
var
	i : Integer;
	data: array of Integer;
begin
	// change length of array to test here.
	SetLength(data,15);
	for i:= 0 to Length(data) do
	begin
		data[i] := i+1;
		WriteLn(data[i]);	
	end; 
	WriteLn('Median is : ',Median(data):4:2);
end;

begin
	Main();
end.