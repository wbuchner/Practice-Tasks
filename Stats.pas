// Author: Wayne Buchner
// Student ID: 6643140
// Date: 03/04/2011
// Program: Median.pas
// Description: Calculate the Median value from an array

program Stats;

uses SysUtils,math;

// function to calculate the sum of an array
function SumArray(const list : array of Double):Double;
var
	i : Integer;
begin
	result := 0;
	for i := Low(list) to High(list) do
	begin
		result := result + list[i];
	end;
end;

// function to calculate the mean value of an array
function CalculateMean(const list : array of Double):Double;
begin
	result := SumArray(list)/Length(list);
end;

Function ReadString(prompt : String):String;
begin
	Write(prompt);
	ReadLn(result);
end;

// calculates the maximum value in an array and returns it
function CalculateMax(const list : array of Double):Double;
var
	i : Integer;
begin
	result := 0;
	for i := Low(list) to High(list) do
	begin
		if result < list[i] then
		begin
		result := list[i];
		end;
	end;	
end;

function CalculateStdDev(var list : array of Double):Double;
var
	i : Integer;
	temp : Double;
begin
	temp := CalculateMean(list);
	for i := Low(list) to High(list) do
	begin
		list[i] := list[i]-temp;
		list[i] := list[i]*list[i];
	end;
	result := Sqrt(SumArray(list)/(Length(list)-1));
end;

// reads the prompt from the user and returns it.
function ReadDouble(prompt: String): Double;
var
	temp: String;
begin
	temp := ReadString(prompt);
	while not TryStrToFloat(temp, result) do
	begin
		WriteLn('Please enter a real number ');
		temp := ReadString(prompt);
	end;
end;

// populates the stats array
procedure PopulateStats(var list : array of Double);
var
	temp : Double;
	i : Integer;
begin
	for i := Low(list) to High(list) do
	begin
		temp := ReadDouble('Enter a value : ');
		list[i] := temp;
	end;
end;

procedure PrintStats(const list : array of Double);
var
	i: Integer;
begin
	for i := Low(list) to High(list) do
	begin
		WriteLn(i+1,' ',list[i]:4:2);
	end;
end;

procedure Main();
var
	stats : array [0..9] of Double;
begin
	PopulateStats(stats);
	WriteLn();
	WriteLn('Calculating totals...');
	WriteLn();
	WriteLn('Sum ',sum(stats):8:2);
	WriteLn('Mean ',Mean(stats):8:2);
	WriteLn('Max ',MaxValue(stats):8:2);
	WriteLn('Stdev ',StdDev(stats):8:2);
	WriteLn();
	WriteLn('Home Made Functions');
	WriteLn('SumArray', SumArray(stats):8:2);
	WriteLn('CalculateMean ',CalculateMean(stats):8:2);
	WriteLn('CalculateMax ',CalculateMax(stats):8:2);
	WriteLn('CalculateStdDev ',CalculateStdDev(stats):8:2);

end;

begin
	Main();
end.