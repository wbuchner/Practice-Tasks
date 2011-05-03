// Author: Wayne Buchner
// Student ID: 6643140
// Date: 03/04/2011
// Program: MyFriends.pas
// Description: reads strings from a prompt into an array
program MyFriends;

Function ReadString(prompt : String):String;
begin
	Write(prompt);
	ReadLn(result);
end;

procedure PopulateFriends(var list : array of String);
var
	temp : String;
	i : Integer;
begin
	for i := Low(list) to High(list) do
	begin
		temp := ReadString('Enter a friends name');
		list[i] := temp;
	end;
	
end;

procedure PrintFriends(const list : array of String);
var
	i: Integer;
begin
	for i := Low(list) to High(list) do
	begin
		WriteLn(list[i]);
	end;
end;

procedure Main();
var
	names : array [0..3] of String;
begin
	PopulateFriends(names);
	PrintFriends(names);
end;

begin
	Main();
end.